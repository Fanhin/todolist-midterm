import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          title: Text("Second Page"),
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          widget.stdListAll[widget.index]['id'],
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
                      child: RaisedButton(
                        onPressed: () => nextStudent(),
                        child: Text(
                          "Next Student >",
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Card(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              widget.stdListSorted[indexNextStudent]['id'],
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.stdListSorted[indexNextStudent]['name'],
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: Text(
                              widget.stdListSorted[indexNextStudent]['score'],
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