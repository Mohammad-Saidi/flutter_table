



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice/provider/image_provider.dart';

import 'image_capture_screen.dart';




void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ImageProviderModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Capture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiImagePicker(),
    );
  }
}