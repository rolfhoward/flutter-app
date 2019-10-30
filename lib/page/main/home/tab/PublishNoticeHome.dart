import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/resource/colors.dart';
import 'package:flutter_app/view/popup_window.dart';

class PublishNoticeHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PublishNoticeState();
  }
}

class PublishNoticeState extends State<PublishNoticeHome> {
  GlobalKey popBottomKey;
  ValueNotifier<int> _sexValue = ValueNotifier<int>(1);
  ValueNotifier<int> _sortValue = ValueNotifier<int>(3);
  ValueNotifier<int> _feeValue = ValueNotifier<int>(5);

  @override
  void initState() {
    super.initState();
    popBottomKey = GlobalKey();
    getData();
  }

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
                        key: popBottomKey,
                        alignment: Alignment.bottomRight,
                        child: Container(
                            width: 48,
                            child: FlatButton(
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                child: Image.asset(
                                    "assets/images/icon_screening.png"),
                                onPressed: () {
                                  _filter();
                                })),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }

  void _filter() {
    PopupWindow.showPopWindow(
        context, "", popBottomKey, PopDirection.bottom, buildWidget(), 5);
  }

  void getData() {}

  Widget buildWidget() {
    List sexList = [
      {"title": "男", "type": 1},
      {"title": "女", "type": 2},
    ];
    List sortList = [
      {"title": "离我最近", "type": 3},
      {"title": "最新发布", "type": 4},
    ];
    List feeList = [
      {"title": "全部", "type": 5},
      {"title": "付费", "type": 6},
      {"title": "免费", "type": 7},
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 12),
              child: Text("性别")),
          GridView.count(
              padding: EdgeInsets.only(left: 12),
              crossAxisCount: 5,
              crossAxisSpacing: 20,
              shrinkWrap: true,
              childAspectRatio: 2 / 1,
              children: sexList.map((value) {
                return ValueListenableBuilder(
                  valueListenable: _sexValue,
                  builder:
                      (BuildContext context, int listenValue, Widget child) {
                    return listItem(context, value, listenValue, _sexValue);
                  },
                );
              }).toList()),
          Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 12),
              child: Text("排序")),
          GridView.count(
              padding: EdgeInsets.only(left: 12),
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              shrinkWrap: true,
              childAspectRatio: 5 / 1.5,
              children: sortList.map((value) {
                return ValueListenableBuilder(
                  valueListenable: _sortValue,
                  builder:
                      (BuildContext context, int listenValue, Widget child) {
                    return listItem(context, value, listenValue, _sortValue);
                  },
                );
              }).toList()),
          Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 12),
              child: Text("资费")),
          GridView.count(
              padding: EdgeInsets.only(left: 12),
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              shrinkWrap: true,
              childAspectRatio: 4 / 2,
              children: feeList.map((value) {
                return ValueListenableBuilder(
                  valueListenable: _feeValue,
                  builder:
                      (BuildContext context, int listenValue, Widget child) {
                    return listItem(context, value, listenValue, _feeValue);
                  },
                );
              }).toList()),
        ],
      ),
    );
  }

  Widget listItem(context, value, int listenValue, valueListenable) {
    return listenValue == value['type']
        ? RaisedButton(
            color: MColors.base_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            onPressed: () {
              valueListenable.value = value['type'];
            },
            child: Text(
              value['title'],
              style: TextStyle(color: Colors.white),
            ))
        : RaisedButton(
            onPressed: () {
              valueListenable.value = value['type'];
            },
            color: MColors.btn_blue_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(value['title'],
                style: TextStyle(color: MColors.base_color)),
          );
  }
}
