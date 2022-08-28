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
      body: Center(
        child: Column(
            children: [
              Container (
                height: MediaQuery.of(context).size.height / 1.2,
                child: bigImage == null ? Text('Loading...') : Image.network(bigImage, fit: BoxFit.contain),
              )
            ]
        )
      )
    );

  }
}
