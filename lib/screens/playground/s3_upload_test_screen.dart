import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';

class S3Upload extends StatefulWidget {
  const S3Upload({super.key});

  @override
  State<S3Upload> createState() => _S3UploadState();
}

class _S3UploadState extends State<S3Upload> {
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
          child: FormHelper.submitButton("Upload", () {}, btnColor: Colors.red),
        )
      ],
    );
  }
}
