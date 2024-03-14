import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:simple_chat_app/models/images_model.dart';

class ImageRepository {
  Future<List<PixelformImage>> getNetworkImages() async {
    try {
      var endpointUrl = Uri.parse('https://pixelford.com/api2/images');

      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;

        final List<PixelformImage> _imageList = decodedList.map((listItem) {
          return PixelformImage.fromJson(listItem);
        }).toList();

        print(_imageList[0].urlFullSize);
        return _imageList;
      } else {
        throw Exception('Failed to load images');
      }
      // The socket exception is thrown when the device has no internet connection
    } on SocketException {
      throw Exception('No Internet connection...🛜');
      // The HttpException is thrown when the server is not reachable
    } on HttpException {
      throw Exception("Couldn't find the post..😅");
      // The FormatException is thrown when the response is not in the expected format
    } on FormatException {
      throw Exception("Bad response format...😓");
    } catch (e) {
      throw Exception('API not successful😔!');
    }
  }
}
