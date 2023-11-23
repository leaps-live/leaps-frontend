import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';

class S3UploadScreen extends StatefulWidget {
  const S3UploadScreen({super.key});
  static const routeName = '/s3upload';

  @override
  State<S3UploadScreen> createState() => _S3UploadScreenState();
}

class _S3UploadScreenState extends State<S3UploadScreen> {
  bool isApiCallProcess = false;
  String singleImageFile = "";
  List<String> selectedMultiImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("S3 Uploading")),
        body: ProgressHUD(
            child: uploadUI(),
            inAsyncCall: isApiCallProcess,
            opacity: .3,
            key: UniqueKey()));
  }

  uploadUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Single Image",
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          child: MultiImagePicker(
              totalImages: 1,
              imageSource: ImagePickSource.gallery,
              onImageChanged: (images) {
                singleImageFile = images[0].imageFile;
              }),
        ),
        const Text("Multiple Image",
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          child: MultiImagePicker(
              totalImages: 5,
              imageSource: ImagePickSource.gallery,
              initialValue: const [],
              onImageChanged: (images) {
                selectedMultiImages = [];

                images.forEach((image) {
                  if (image is ImageUploadModel) {
                    selectedMultiImages.add(image.imageFile);
                  }
                });

                singleImageFile = images[0].imageFile;
              }),
        ),
        Center(
          child: FormHelper.submitButton("Upload", () {},
              btnColor: Colors.redAccent,
              borderColor: Colors.redAccent,
              txtColor: Colors.white,
              borderRadius: 10),
        )
      ],
    );
  }
}
