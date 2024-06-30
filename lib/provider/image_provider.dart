import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageProviderModel with ChangeNotifier {
  List<String> _imagePaths = [];

  List<String> get images => _imagePaths;

  ImageProviderModel() {
    _loadImages();
  }

  Future<void> _loadImages() async {
    final prefs = await SharedPreferences.getInstance();
    _imagePaths = prefs.getStringList('images') ?? [];
    notifyListeners();
  }

  Future<void> _saveImages() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('images', _imagePaths);
  }

  void addImage(String imagePath) {
    _imagePaths.add(imagePath);
    _saveImages();
    notifyListeners();
  }

  void removeImage(int index) {
    _imagePaths.removeAt(index);
    _saveImages();
    notifyListeners();
  }

  void replaceImage(int index, String imagePath) {
    _imagePaths[index] = imagePath;
    _saveImages();
    notifyListeners();
  }

  void reorderImages(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final String imagePath = _imagePaths.removeAt(oldIndex);
    _imagePaths.insert(newIndex, imagePath);
    _saveImages();
    notifyListeners();
  }

  Future<void> clearImages() async {
    _imagePaths.clear();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('images');
    notifyListeners();
  }
}
