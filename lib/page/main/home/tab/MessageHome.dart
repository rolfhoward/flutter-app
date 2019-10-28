import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/resource/colors.dart';

class MessageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MessageState();
  }
}

class MessageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: MColors.white,
        body: new SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  height: 50,
                  child: Stack(
                    children: <Widget>[
                      //可以通过alignment属性，设置其子widget与其对齐方式，默认center；
                      //所以下面我们分别给注册和登录设置了居左和居右
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "消息中心",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          highlightColor: Colors.white,
                          splashColor: Colors.white,
                          child: Text("设置",
                              style: TextStyle(color: MColors.base_color, fontSize: 14)),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
