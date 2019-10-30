import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/page/main/home/home.dart';
import 'package:flutter_app/resource/colors.dart';
import 'package:flutter_app/util/dialog_utils.dart';
import 'package:flutter_app/util/regexp_utils.dart';
import 'package:flutter_app/viewmodel/login/login_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  //手机号的控制器
  TextEditingController _phoneController = TextEditingController();

  //密码的控制器
  TextEditingController _passwordController = TextEditingController();
  LoginProvider _loginProvider = LoginProvider();
  final _loading = LoadingDialog();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: MColors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: MColors.white,
        centerTitle: true,
        title: Text(
          '登录',
          textAlign: TextAlign.center,
          style: new TextStyle(color: MColors.black, fontSize: 18),
        ),
        leading: IconButton(
          iconSize: 12,
          padding: EdgeInsets.all(8.0),
          icon: Image.asset('assets/images/icon_back.png'),
          onPressed: () {
            Navigator.of(context).pop(1);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 38.0, top: 42.0, right: 38.0),
                child: new ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 46,
                  ),
                  child: new Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: MColors.base_text_grey_color,
                    color: MColors.base_text_grey_color,
                    elevation: 5.0,
                    child: new TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                            prefixIcon:
                                Image.asset("assets/images/icon_phone.png"),
                            fillColor: Colors.transparent,
                            border: InputBorder.none,
                            hintText: "手机号",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            )),
                        maxLines: 1,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        autofocus: false),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 38.0, right: 38.0, top: 16.0),
              child: new ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 46,
                  ),
                  child: new Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: MColors.base_text_grey_color,
                    color: MColors.base_text_grey_color,
                    child: new TextField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                            prefixIcon:
                                Image.asset("assets/images/icon_password.png"),
                            fillColor: Colors.transparent,
                            border: InputBorder.none,
                            hintText: "密码"),
                        obscureText: true),
                  )),
            ),
            Container(
              width: double.infinity,
              height: 48,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 38, right: 38),
              child: RaisedButton(
                onPressed: _login,
                child: Text('登录', style: TextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                color: MColors.base_color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _login() {
    var username = _phoneController.text;
    var password = _passwordController.text;
    if (username.length == 0) {
      Fluttertoast.showToast(msg: "请输入手机号", toastLength: Toast.LENGTH_SHORT);
      return;
    }
    if (username.length != 11 || !RegExpUtils.isMobileExact(username)) {
      Fluttertoast.showToast(msg: "手机号码格式不对", toastLength: Toast.LENGTH_SHORT);
      return;
    }
    if (password.length == 0) {
      Fluttertoast.showToast(msg: "请输入密码", toastLength: Toast.LENGTH_SHORT);
      return;
    }
    _loginProvider
        .login(username, password)
        .doOnListen(() {
          _loading.message = "正在登录...";
          _loading.show(context);
        })
        .doOnCancel(() {})
        .listen((data) {
          _loading.hide(context);
          Fluttertoast.showToast(msg: "登录成功", toastLength: Toast.LENGTH_SHORT);
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => new Home()));
          _passwordController.clear();
        }, onError: (e) {
          _loading.hide(context);
          _passwordController.clear();
        });
  }
}
