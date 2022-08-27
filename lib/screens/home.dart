import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'image_screen.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = 'https://api.unsplash.com/photos?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';
  Future getUserData() async {
    var response = await http.get(
        Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List<Picture> pictures = [];
    for (var u in jsonData) {
      Picture picture = Picture(
          u['id'],
          u['urls']['thumb'],
          u['urls']['full'],
          u['user']['name'],
          u['description']
      );
      pictures.add(picture);
    }
    return pictures;
  }
  @override
  void initState() {
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.grey[800],
            appBar: AppBar(
              backgroundColor: Colors.grey[900],
              title: Text('UNSPLASH IMAGES'),
              centerTitle: true,
            ),
            body: Center(
              child: Card(
                color: Colors.grey[800],
                  child: FutureBuilder(
                    future: getUserData(),
                    builder: (context, AsyncSnapshot snapshot){
                      if (snapshot == null) {
                        return Container(child: Center(child: Text('Loading')));
                      } else return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                                snapshot.data[i].thumb,
                                height: 100, width: 50,
                                fit: BoxFit.cover),
                            title: Text(snapshot.data[i].name),
                            subtitle: snapshot.data[i].description != null ?
                              Text(snapshot.data[i].description) :
                              Text("There's no description :("),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ImageScreen(),
                                settings: RouteSettings(
                                  arguments: snapshot.data[i].full,
                                )
                              ));
                            }
                          )
                        );
                      });
                    },
                  )
              )
            )
      );
    }
  }


class Picture {
  final String id, thumb, full, name;
  String? description;
  Picture(this.id, this.thumb, this.full, this.name, this.description);
}