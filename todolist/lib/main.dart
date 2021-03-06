import 'package:flutter/material.dart';
import 'package:todolist/config/routes.dart';

import 'package:todolist/edit_page.dart';

import 'home_pageV2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.black),
          fontFamily: 'FredokaOne',
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black))),
      routes: {
        Routes.edit_page: (context) => EditPage(),
      },
    );
  }
}
