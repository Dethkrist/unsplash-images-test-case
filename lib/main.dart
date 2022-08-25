import 'package:flutter/material.dart';
import 'package:nsplash_images/screens/home.dart';
import 'package:nsplash_images/screens/image_screen.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.green,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/image': (context) => ImageScreen(),
  },
));

