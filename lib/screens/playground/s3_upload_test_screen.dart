import 'package:flutter/material.dart';
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

class _S3UploadScreenState extends State<S3UploadScreen> {
  @override
  void initState() {
    super.initState();
  }

  uploadUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Single Image",
            style: TextStyle(fontWeight: FontWeight.bold)),
        MultiImagePicker(
            totalImages: 1,
            onImageChanged: (images) {
              singleImageFile = images[0].image;
            },
            imageSource: ImagePickSource.gallery)
      ],
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
