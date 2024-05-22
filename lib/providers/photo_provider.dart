import 'package:e_shop/models/photo.dart';
import 'package:e_shop/services/photo_service.dart';
import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier {
  List<Photo> _data = [];
  List<Photo> get data => _data;
  PhotoProvider() {
    _load();
  }
  _load() async {
    _data = await PhotoService().fetchPhoto();
    notifyListeners();
  }

  add(Photo photo) {
    _data.insert(0, photo);
    notifyListeners();
  }

  remove(Photo photo) {
    _data.remove(photo);
    notifyListeners();
  }
}
