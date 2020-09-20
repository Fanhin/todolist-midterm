import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String inputScore;
  String studentName;
  bool _validate = false;
  var _nameTextFieldController = TextEditingController();

  @override
  void initState() {
    inputScore = '0';
    super.initState();
  }

  void setScore(String score) {
    setState(() {
      if (inputScore == '0' && score == '0') {
      } else if (inputScore == '0' && score != '0') {
        inputScore = score;
      } else
        inputScore += score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EditPage'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: TextFormField(
                      controller: _nameTextFieldController,
                      decoration: InputDecoration(
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        icon: Text(
                          "Name",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    height: 70,
                    color: Colors.lightBlueAccent,
                    child: Center(
                      child: Text(inputScore),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  child: RaisedButton(
                                      onPressed: () {
                                        setScore('7');
                                      },
                                      child: Container(
                                          child: Text(
                                        "7",
                                      )))),
                              Container(
                                  child: RaisedButton(
                                      onPressed: () {
                                        setScore('8');
                                      },
                                      child: Container(
                                          child: Text(
                                        "8",
                                      )))),
                              Container(
                                  child: RaisedButton(
                                      onPressed: () {
                                        setScore('9');

                                        ///
                                      },
                                      child: Container(
                                          child: Text(
                                        "9",
                                      ))))
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: RaisedButton(
                                    onPressed: () {
                                      setScore('4');

                                      ///
                                    },
                                    child: Container(
                                        child: Text(
                                      "4",
                                    )))),
                            Container(
                                child: RaisedButton(
                                    onPressed: () {
                                      setScore('5');

                                      ///
                                    },
                                    child: Container(
                                        child: Text(
                                      "5",
                                    )))),
                            Container(
                                child: RaisedButton(
                                    onPressed: () {
                                      setScore('6');

                                      ///
                                    },
                                    child: Container(
                                        child: Text(
                                      "6",
                                    ))))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: RaisedButton(
                                    onPressed: () {
                                      setScore('1');

                                      ///
                                    },
                                    child: Container(
                                        child: Text(
                                      "1",
                                    )))),
                            Container(
                                child: RaisedButton(
                                    onPressed: () {
                                      setScore('2');

                                      ///
                                    },
                                    child: Container(
                                        child: Text(
                                      "2",
                                    )))),
                            Container(
                                child: RaisedButton(
                                    onPressed: () {
                                      setScore('3');

                                      ///
                                    },
                                    child: Container(
                                        child: Text(
                                      "3",
                                    ))))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: RaisedButton(
                                    onPressed: () {
                                      setState(() {
                                        inputScore = '0';
                                      });

                                      ///
                                    },
                                    child: Text(
                                      "CLR",
                                    ))),
                            Container(
                                child: RaisedButton(
                                    onPressed: () {
                                      setScore('0');

                                      ///
                                    },
                                    child: Text(
                                      "0",
                                    ))),
                            Container(
                                child: RaisedButton(
                                    onPressed: () {
                                      setState(() {
                                        _nameTextFieldController.text.isEmpty
                                            ? _validate = true
                                            : _validate = false;
                                      });
                                      _validate
                                          ? Fluttertoast.showToast(
                                              msg: 'Name can not empty',
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0)
                                          : Navigator.pop((context), {
                                              'score': inputScore,
                                              'name':
                                                  _nameTextFieldController.text
                                            });
                                    },
                                    child: Text(
                                      "OK",
                                    )))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
