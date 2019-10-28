import 'package:flutter/material.dart';
import 'package:flutter_app/page/login/login.dart';

void main() => runApp(
    MaterialApp(
      title: "login main",
      home: App(),
    )
);

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'MyApp',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
        home: HomePage());
  }
}