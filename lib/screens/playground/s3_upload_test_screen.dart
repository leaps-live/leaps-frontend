import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class S3UploadScreen extends StatefulWidget {
  const S3UploadScreen({super.key});
  static const routeName = '/s3upload';

  @override
  State<S3UploadScreen> createState() => _S3UploadScreenState();
}

class _S3UploadScreenState extends State<S3UploadScreen> {
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: const CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("S3 Uploading")),
        body: Column(
          children: <Widget>[
            Center(child: Text('Error: $_error')),
            ElevatedButton(
              onPressed: loadAssets,
              child: const Text("Pick images"),
            ),
            Expanded(
              child: buildGridView(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30.0),
              child: ElevatedButton(
                onPressed: loadAssets,
                child: const Text("Upload"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
