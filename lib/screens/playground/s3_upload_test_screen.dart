import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';
// import 'dart:async';
// import 'package:multi_image_picker2/multi_image_picker2.dart';

class S3UploadScreen extends StatefulWidget {
  const S3UploadScreen({super.key});
  static const routeName = '/s3upload';

  @override
  State<S3UploadScreen> createState() => _S3UploadScreenState();
}

// 22:44

class _S3UploadScreenState extends State<S3UploadScreen> {
  @override
  void initState() {
    super.initState();
  }

  uploadUI() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Single Image",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            child: MultiImagePicker(
                totalImages: 1,
                onImageChanged: (images) {
                  singleImageFile = images[0].image;
                },
                imageSource: ImagePickSource.gallery,
                initialValue: const []),
          ),
          const Text("Multiple Images",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            child: MultiImagePicker(
                totalImages: 5,
                onImageChanged: (images) {
                  selectedMultiImages = [];
                  images.forEach((image) {
                    if (image is ImageUploadModel) {
                      selectedMultiImages.add(image.imageFile);
                    }
                  });
                  singleImageFile = images[0].image;
                },
                imageSource: ImagePickSource.gallery,
                initialValue: const []),
          ),
          Center(
            child: FormHelper.submitButton("Upload", () {},
                btnColor: primaryColor,
                borderColor: primaryColor,
                txtColor: Colors.black,
                borderRadius: 10),
          )
        ],
      ),
    );
  }

  bool isApiCallprocess = false;
  String singleImageFile = "";
  List<String> selectedMultiImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("S3 Uploading")),
      body: ProgressHUD(
          key: UniqueKey(),
          child: uploadUI(),
          inAsyncCall: isApiCallprocess,
          opacity: .3),
    );
  }
}
