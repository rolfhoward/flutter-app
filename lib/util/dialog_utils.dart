import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends CupertinoAlertDialog {
  BuildContext currentContext;

  String _message = "";

  String get message => _message;

  set message(String message) {
    _message = message;
  }

  show(BuildContext context) {
    showing = true;
    _showLoadingDialog(context, this).then((r) {
      showing = false;
    });
  }

  showByText(BuildContext context, String text) {
    showing = true;
    _showLoadingDialog(context, this).then((r) {
      showing = false;
    });
  }

  bool showing;

  hide(BuildContext context) {
    if (showing) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    currentContext = context;
    return WillPopScope(
      onWillPop: () => Future.value(!bool.fromEnvironment("dart.vm.product")),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: Container(
              width: 120,
              height: 120,
              color: Colors.transparent,
              child: Center(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                      width: 45.0,
                      height: 45.0,
                      child: const CircularProgressIndicator(strokeWidth: 2.0)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(_message,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          decoration: TextDecoration.none))
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}

/**
 * 显示loading框  , 隐藏调用 Navigator.pop(context)
 */
Future _showLoadingDialog(BuildContext c, LoadingDialog loading,
        {bool cancelable = true}) =>
    showDialog(
        context: c,
        barrierDismissible: cancelable,
        builder: (BuildContext c) => loading);
