import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/page/main/home/tab/JellyGardenHome.dart';
import 'package:flutter_app/page/main/home/tab/MeHome.dart';
import 'package:flutter_app/page/main/home/tab/MessageHome.dart';
import 'package:flutter_app/page/main/home/tab/PublishNoticeHome.dart';
import 'package:flutter_app/util/device_utils.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePageState();
  }
}

class _HomePageState extends State<Home> with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  var appBarTitles = ['果冻花园', '寂寞告白', '消息', '我的'];
  var _pageList;
  var tabImages;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    initData();
    DeviceUtil.setBarStatus(true);
    return new Scaffold(
        body: _pageList[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                title: getTabTitle(0), icon: getTabIcon(0)),
            new BottomNavigationBarItem(
                title: getTabTitle(1), icon: getTabIcon(1)),
            new BottomNavigationBarItem(
                title: getTabTitle(2), icon: getTabIcon(2)),
            new BottomNavigationBarItem(
                title: getTabTitle(3), icon: getTabIcon(3)),
          ],
          //底部栏整体的颜色
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          //默认选中首页
          currentIndex: _tabIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          //点击事件
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }

  void initData() {
    tabImages = [
      [getTabImage('assets/images/icon_home_jelly_garden.png'), getTabImage('assets/images/icon_home_jelly_garden_press.png')],
      [getTabImage('assets/images/icon_home_publish_notice.png'), getTabImage('assets/images/icon_home_publish_notice_press.png')],
      [getTabImage('assets/images/icon_home_message.png'), getTabImage('assets/images/icon_home_message_press.png')],
      [getTabImage('assets/images/icon_home_me.png'), getTabImage('assets/images/icon_home_me_press.png')]
    ];
    _pageList = [
      new JellyGardenHome(),
      new PublishNoticeHome(),
      new MessageHome(),
      new MeHome(),
    ];
  }

/*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff5a88ca)));
    } else {
        return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff888888)));
    }
  }

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }
}
