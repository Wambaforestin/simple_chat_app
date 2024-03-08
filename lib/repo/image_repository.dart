import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:simple_chat_app/models/images_model.dart';
class ImageRepository{
  Future<List<PixelformImage>> getNetworkImages() async {
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
      throw Exception('API not successful!');
    }
  }
}