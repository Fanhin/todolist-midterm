import 'package:flutter/material.dart';
import 'package:todolist/config/routes.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text(
            'My List',
            style: TextStyle(fontSize: 45),
          ),
        ),
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
                      scrollDirection: Axis.vertical,
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
                              color: Colors
                                  .primaries[index % Colors.primaries.length]
                                  .withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 8,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.amber, width: 8),
                                      ),
                                      child: Text((index + 1).toString()),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        'ID :' + (index + 1).toString(),
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                        child: Text(
                                      '${stdList[index]['name']}',
                                      style: TextStyle(fontSize: 25),
                                    )),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Text(
                                        '${stdList[index]['score']}',
                                        style: TextStyle(fontSize: 35),
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
          //Navigator.pushNamed(context, Routes.edit_page);
          if (data != null) {
            setState(() {
              stdList.add({'id':(data.length+1).toString(),'name': data['name'], 'score': data['score']});
            });
          }
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
