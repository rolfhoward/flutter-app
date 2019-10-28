import 'dart:core';

import 'package:flutter/services.dart';
import 'package:flutter_app/base/ResultModel.dart';
import 'package:flutter_app/base/base_provider.dart';
import 'package:flutter_app/model/login_model.dart';
import 'package:flutter_app/net/NetUtils.dart';
import 'package:flutter_app/util/dialog_utils.dart';
import 'package:flutter_app/util/string_utils.dart';
import 'package:rxdart/rxdart.dart';

class LoginProvider extends BaseProvider {
  LoginModel _loginModel = LoginModel();

  Observable login(String username, String password){
    var _password = generateMd5(password);
    return _loginModel.login(username, _password).doOnDone((){

    });
  }

}
