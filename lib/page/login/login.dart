import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/page/login/start_login.dart';
import 'package:flutter_app/page/main/home/home.dart';
import 'package:flutter_app/resource/colors.dart';
import 'package:flutter_app/view/buttom_clipper.dart';

//void main() {
//  runApp(MaterialApp(
//    debugShowCheckedModeBanner: false,
//    home: HomePage(),
//  ));
//}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //改变状态栏文字颜色为白色
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarBrightness: Brightness.dark));
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(alignment: Alignment(0.0, 1.0), children: [
                  // 裁切的控件
                  ClipPath(
                    // 只裁切底部的方法
                    clipper: ButtonClipper(),
                    child: Container(
                      color: MColors.base_color,
                      height: 210,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      new Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              ///阴影颜色/位置/大小等
                              BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(0, 0),
                                  blurRadius: 3),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child:
                              Image.asset('assets/images/icon.png'),
                        ),
                      )
                    ],
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: 48,
                margin: EdgeInsets.only(top: 60),
                padding: EdgeInsets.only(left: 38, right: 38),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new Login()));
                  },
                  child: Text('登录', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: MColors.base_color,
                ),
              ),
              Container(
                width: double.infinity,
                height: 48,
                margin: EdgeInsets.only(top: 22),
                padding: EdgeInsets.only(left: 38, right: 38),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new Home()));
                  },
                  child: Text(
                    '注册',
                    style: TextStyle(color: MColors.base_color),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: MColors.base_color,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Container(
                        margin: EdgeInsets.only(left:22.0, right: 22),
                        decoration: BoxDecoration(border: Border.all(width: 0.5, color: MColors.base_line_color)),
                      ),
                    ),
                    Text(
                      "或",
                      style: TextStyle(
                        color: MColors.base_text_grey_color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: new Container(
                        margin: EdgeInsets.only(left:22.0, right: 22),
                        decoration: BoxDecoration(border: Border.all(width: 0.5, color: MColors.base_line_color)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                alignment: FractionalOffset.bottomCenter,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      iconSize: 42,
                      icon: Image.asset('assets/images/icon_wechat.png'),
                      onPressed: (){},
                    ),
                    IconButton(
                      iconSize: 42,
                      icon: Image.asset('assets/images/icon_qq.png'),
                      onPressed: (){},
                    ),
                    IconButton(
                      iconSize: 42,
                      icon: Image.asset('assets/images/icon_weibo.png'),
                      onPressed: (){},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
