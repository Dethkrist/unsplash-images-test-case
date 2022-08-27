import 'package:flutter/material.dart';

import 'home.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  @override
  Widget build(BuildContext context) {
    final bigImage = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          bigImage == null ? Text('Loading...') : Image.network(bigImage),
        ]
      )
    );

  }
}
