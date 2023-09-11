import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/landing/confirmationcode_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Define controllers to capture user input
  final TextEditingController userFirstNameController = TextEditingController();
  final TextEditingController userLastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? codeDestination;
  String? codeDeliveryMedium;

  /// Signs a user up with a username, password, and email.
  Future<void> signUpUser() async {
    if (userFirstNameController.text.isEmpty ||
        userLastNameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        emailController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please fullfil all the fields",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Fluttertoast.showToast(
        msg: "The password is different from the confirmation password.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    const String apiUrl = 'http://localhost:8080/users/register';

    // Create a map with the collected data
    final Map<String, dynamic> userData = {
      'userFirstName': userFirstNameController.text,
      'userLastName': userLastNameController.text,
      'username': usernameController.text,
      'userEmail': emailController.text,
      'userPassword': passwordController.text,
      'userBirthday': '2000-1-1',
      'userHeight': null,
      'userWeight': null,
    };

    try {
      final userAttributes = {
        AuthUserAttributeKey.email: emailController.text,
        // additional attributes as needed
      };

      final result = await Amplify.Auth.signUp(
        username: emailController.text,
        password: passwordController.text,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );

      print('amplify auth sign up result:');
      print(result);

      await _handleSignUpResult(result);
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // Successfully sent data to the backend

        String emailToSend = emailController.text;

        print('Account registered successfully! $emailToSend');

        final Map<String, dynamic> dataToSend = {
          'codeDestination': codeDestination,
          'codeDeliveryMedium': codeDeliveryMedium,
          'email': emailController.text,
          'password': passwordController.text
        };

        Fluttertoast.showToast(
          msg: "A confirmation code was sent to $emailToSend",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green[400],
          textColor: Colors.white,
        );

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(
            context, ConfirmationCodeScreen.routeName,
            arguments: dataToSend);
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Email has already existed.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );
      } else if (response.statusCode == 402) {
        Fluttertoast.showToast(
          msg: "Username has already existed.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
        );
      }
    } on AuthException catch (e) {
      print('Error signing up user: ${e.message}');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthSignUpStep.done:
        print('Sign up is complete');
        break;
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    setState(() {
      codeDestination = codeDeliveryDetails.destination;
      codeDeliveryMedium = codeDeliveryDetails.deliveryMedium.name;
    });

    print(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }

  // change button color when all the fields are filled
  bool areAllFieldsFilled = false;
  bool isLoading = false;

  void _checkIfFieldFilled() {
    setState(() {
      areAllFieldsFilled = emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty &&
          userFirstNameController.text.isNotEmpty &&
          userLastNameController.text.isNotEmpty &&
          usernameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    // Dispose the controllers to free up resources
    userFirstNameController.dispose();
    userLastNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: userFirstNameController,
                      onChanged: (value) {
                        _checkIfFieldFilled(); // Update button state on input change
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        hintText: 'User First Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 32), // Add a 16 space between the text fields
                  Expanded(
                    child: TextField(
                      controller: userLastNameController,
                      onChanged: (value) {
                        _checkIfFieldFilled(); // Update button state on input change
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'User Last Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: usernameController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: confirmPasswordController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: 300,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 13, // 设置默认字体大小
                      color: Colors.black, // 设置默认字体颜色
                    ),
                    children: [
                      TextSpan(
                        text: "By signing up, you agree to our ",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: "Terms of Use",
                        style: TextStyle(fontWeight: FontWeight.bold), // 加粗样式
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(fontWeight: FontWeight.bold), // 加粗样式
                      ),
                      TextSpan(
                        text: ".",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    signUpUser();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        areAllFieldsFilled ? primaryColor : Colors.grey,
                    fixedSize: const Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: isLoading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sign up'),
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          ],
                        )
                      : const Text('Sign up'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        width: 120,
                        height: 1,
                        color: const Color(0xFFD7D7D7),
                      ),
                    ),
                    const TextSpan(
                      text: " Or sign up with ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        width: 120,
                        height: 1,
                        color: const Color(0xFFD7D7D7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/google.png', // 替换为你的图片路径
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.apple),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
