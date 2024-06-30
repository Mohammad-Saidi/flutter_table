import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class MultiImagePicker extends StatefulWidget {
  @override
  _MultiImagePickerState createState() => _MultiImagePickerState();
}

class _MultiImagePickerState extends State<MultiImagePicker> {
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? imagePaths = prefs.getStringList('images');
    if (imagePaths != null) {
      setState(() {
        _images = imagePaths.map((path) => File(path)).toList();
      });
    }
  }

  Future<void> _saveImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> imagePaths = _images.map((file) => file.path).toList();
    await prefs.setStringList('images', imagePaths);
  }

  Future<void> _pickImage(ImageSource source, [int? index]) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        if (index == null) {
          _images.add(File(image.path));
        } else {
          _images[index] = File(image.path);
        }
        _saveImages();
      });
    }
  }

  Future<void> _pickMultipleImages() async {
    bool picking = true;
    while (picking) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _images.add(File(image.path));
          _saveImages();
        });
      } else {
        picking = false;
      }
    }
  }

  void _deleteImage(int index) {
    setState(() {
      _images.removeAt(index);
      _saveImages();
    });
  }

  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera, index);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery, index);
            },
          ),
        ],
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final File item = _images.removeAt(oldIndex);
      _images.insert(newIndex, item);
      _saveImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Image Picker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_photo_alternate),
            onPressed: () => _pickMultipleImages(),
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () => _pickImage(ImageSource.camera),
          ),
        ],
      ),
      body: ReorderableListView(
        onReorder: _onReorder,
        children: _images.asMap().entries.map((entry) {
          int index = entry.key;
          File image = entry.value;
          return ListTile(
            key: ValueKey(image.path),
            leading: GestureDetector(
              onTap: () => _showBottomSheet(context, index),
              child: Image.file(image, width: 100, height: 100, fit: BoxFit.cover),
            ),
            title: Text('Image ${index + 1}'),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteImage(index),
            ),
          );
        }).toList(),
      ),
    );
  }
}
