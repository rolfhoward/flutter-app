import 'package:flutter_app/base/ResultModel.dart';
import 'package:flutter_app/net/NetUtils.dart';
import 'package:rxdart/rxdart.dart';

class LoginModel{
  Observable<ResultModel> login(String username, String password){
    Map<String, String> param = {"username": username, "password": password};
    return NetUtils.getInstance().post("/v1/login", queryParameters: param);
  }
}