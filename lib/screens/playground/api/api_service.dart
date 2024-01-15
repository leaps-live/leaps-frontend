import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<bool> uploadImages(
      String singleImageFile, List<String> multipleImages) async {
    var url = Uri.http("127.0.0.1:8080", "/upload//upload-single-v3/:userid");

    var request = http.MultipartRequest("POST", url);

    if (singleImageFile.isNotEmpty) {
      http.MultipartFile singleFile =
          await http.MultipartFile.fromPath("file", singleImageFile);

      request.files.add(singleFile);
    }

    if (multipleImages.isNotEmpty) {
      multipleImages.forEach((file) async {
        http.MultipartFile multiFile =
            await http.MultipartFile.fromPath("files", file);

        request.files.add(multiFile);
      });
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
