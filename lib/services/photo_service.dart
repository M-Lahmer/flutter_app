import 'dart:convert';

import 'package:e_shop/models/photo.dart';
import 'dart:io' show Platform;
import "package:http/http.dart" as http;

class PhotoService {
  var devUrlPhoto = '';

  getUrlPhoto() {
    if (Platform.isAndroid) {
      return "http://172.29.161.7:8000/photos";
    }
    if (Platform.isIOS) {
      return "http://localhost:8000/photos";
    } else {
      return "http://localhost:8000/photos";
    }
  }

  Future<List<Photo>> fetchPhoto() async {
    final response = await http.get(Uri.parse(getUrlPhoto()));
    if (response.statusCode == 200) {
      Iterable iterable = json.decode(response.body);
      return List.from(iterable.map((e) => Photo.fromJson(e)));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
