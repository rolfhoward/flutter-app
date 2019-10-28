import 'package:flutter/material.dart';
import 'package:flutter_app/page/login/login.dart';

void main() => runApp(new App());

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}