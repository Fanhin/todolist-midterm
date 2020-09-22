import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'edit_page.dart';

class SecondPage extends StatefulWidget {
  final Map stdList;
  int index;
  final List<Map> stdListAll;
  List<Map> stdListSorted;

  SecondPage(this.stdList, this.index, this.stdListAll) {
    stdListSorted = List.from(stdListAll);
    stdListSorted.sort((a, b) => a['score'].compareTo(b['score']));
  }

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int indexNextStudent;
  bool topScore;
  List colors = [
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.deepOrange,
    Colors.green,
    Colors.purpleAccent,
    Colors.pinkAccent,
  ];
  Random randomColor = Random();

  int intColor = 0;

  //  void changeIndex() {
  //   setState(() => intColor = randomColor.nextInt(3));
  //}

  @override
  void initState() {
    topScore = false;
    indexNextStudent =
        widget.stdListSorted.indexOf(widget.stdListAll[widget.index]) + 1;
    if (indexNextStudent >= widget.stdListSorted.length - 1) {
      indexNextStudent = widget.stdListSorted.length - 1;
      topScore = true;
    }
    super.initState();
  }

  void nextStudent() {
    setState(() {
      if (++indexNextStudent >= widget.stdListSorted.length - 1) {
        indexNextStudent = widget.stdListSorted.length - 1;
        topScore = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    final Map result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditPage(
                                  stdList: widget.stdList,
                                )));
                    if (result != null) {
                      Navigator.pop((context), result);
                    }
                  },
                  child: Icon(Icons.edit),
                ))
          ],
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Card(
                      color: Colors.primaries[randomColor.nextInt(255) %
                              Colors.primaries.length]
                          .withOpacity(0.6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              'ID:' + widget.stdListAll[widget.index]['id'],
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.stdList['name'],
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: Text(
                              widget.stdList['score'],
                              style: TextStyle(fontSize: 70),
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  child: Column(children: <Widget>[
                    Container(
                      constraints: BoxConstraints.expand(
                        height: 70,
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () => {
                            if (topScore)
                              {
                                Fluttertoast.showToast(
                                    msg: widget.stdListSorted[indexNextStudent]
                                                ['name']
                                            .toString() +
                                        ' is Top!',
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0)
                              }
                            else
                              {nextStudent()}
                          },
                          child: Text(
                            "Next Student >",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Card(
                          color: Colors.primaries[randomColor.nextInt(255) %
                                  Colors.primaries.length]
                              .withOpacity(0.8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                child: Text(
                                  'ID:' +
                                      widget.stdListSorted[indexNextStudent]
                                          ['id'],
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              Container(
                                child: Text(
                                  widget.stdListSorted[indexNextStudent]
                                      ['name'],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Text(
                                  widget.stdListSorted[indexNextStudent]
                                      ['score'],
                                  style: TextStyle(fontSize: 70),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ]),
                )
              ]),
        ));
  }
}
