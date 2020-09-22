import 'package:flutter/material.dart';
import 'package:todolist/second_page.dart';

import 'edit_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> stdList = [
    {"id": "1", "name": "JJ", "score": "80"},
    {"id": "2", "name": "Poon", "score": "77"},
    {"id": "3", "name": "Geng", "score": "85"},
    {"id": "4", "name": "John", "score": "60"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('My List Home Page V2'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  //padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    child: ListView.builder(
                      itemCount: stdList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final Map result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                        stdList[index], index, stdList)));
                            if (result != null) {
                              setState(() {
                                stdList[index]['name'] = result['name'];
                                stdList[index]['score'] = result['score'];
                                print(result);
                              });
                            }
                          },
                          child: Container(
                            height: 90,
                            child: Card(
                              //color: Colors.grey[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 8,
                              child: Container(
                                color: Colors.primaries[index % Colors.primaries.length],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.amber,width: 8),
                                        
                                      ),
                                      child: Text((index + 1).toString()),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text('ID :'+(index + 1).toString()),
                                    ),
                                    Container(
                                      child: Text(
                                        '${stdList[index]['name']}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Text(
                                        '${stdList[index]['score']}',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map data = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditPage()));
          if (data != null) {
            setState(() {
              stdList.add({'name': data['name'], 'score': data['score']});
              print({'name': data['name'], 'score': data['score']});
            });
          }
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
