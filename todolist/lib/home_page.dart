import 'package:flutter/material.dart';
import 'package:todolist/config/routes.dart';

class HomePage extends StatelessWidget {
  List<Map> stdList = [
    {"name": "JJ", "score": "80"},
    {"name": "Poon", "score": "77"},
    {"name": "Geng", "score": "85"},
    {"name": "John", "score": "60"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My List'),
        ),
        body: ListView(
          children: [
            for (int i = 0; i < stdList.length; i++)
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text("${i + 1}"),
                    ),
                    Container(
                      child: Text("${stdList[i]["name"]}"),
                    ),
                    Container(
                      child: Text("${stdList[i]["score"]}"),
                    ),
                  ],
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.edit_page);
          },
          child: Icon(Icons.navigation),
        ),
      ),
    );
  }
}
