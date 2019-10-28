import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/resource/colors.dart';

class MeHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MeState();
  }

}

class MeState extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: MColors.white,
        body: new SafeArea(
          child: Column(
            children: <Widget>[

            ],
          ),
        ));
  }

}