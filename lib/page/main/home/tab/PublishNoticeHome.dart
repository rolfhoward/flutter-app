import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/resource/colors.dart';

class PublishNoticeHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PublishNoticeState();
  }
}

class PublishNoticeState extends State<PublishNoticeHome> {
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
                        alignment: Alignment.topLeft,
                        child: Container(
                            width: 74,
                            child: FlatButton(
                              padding: EdgeInsets.only(left: 12, right: 18),
                              onPressed: () => {},
                              highlightColor: Colors.white,
                              splashColor: Colors.white,
                              child: Row(children: <Widget>[
                                Text('北京',
                                    style: TextStyle(
                                        color: MColors.text_grey_color,
                                        fontSize: 14)),
                                Padding(padding: EdgeInsets.only(left: 7)),
                                Image.asset(
                                    "assets/images/icon_arrow_down.png"),
                              ]),
                            )),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "寂寞告白",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            width: 48,
                            child: FlatButton(
                            highlightColor: Colors.white,
                            splashColor: Colors.white,
                                child: Image.asset(
                                    "assets/images/icon_screening.png"),
                                onPressed: () {})),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
