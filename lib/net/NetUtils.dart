import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/base/ResultModel.dart';
import 'package:flutter_app/base/api_config.dart';
import 'package:rxdart/rxdart.dart';

enum Method {
  GET,
  POST,
  UPLOAD,
  DOWNLOAD,
}

class NetUtils{

  static NetUtils _instance;

  static NetUtils getInstance() {
    if (_instance == null) {
      _instance = new NetUtils();
    }
    return _instance;
  }

  Dio dio;
  BaseOptions options;

  NetUtils() {
    dio = new Dio()
      ..options = BaseOptions(
          baseUrl: ApiConfig.baseUrl,
          connectTimeout: 30000,
          receiveTimeout: 30000);
  }

  Observable<ResultModel> post(String url,{dynamic body,Map<String, dynamic> queryParameters}) =>
      Observable.fromFuture(_post(url, body: body,queryParameters: queryParameters)).delay(Duration(milliseconds: 500)).asBroadcastStream();

  Future<ResultModel> _post(String url, {dynamic body, Map<String, dynamic> queryParameters}) async {
    var response = await dio.post(url, data: body, queryParameters: queryParameters);
    var res = ResultModel.fromJson(response.data);
    return res;
  }

  static Future postT(String url, {Map<String, dynamic> params, Function errorCallback}) async{
    Dio dio = Dio();
    Response response = await dio.post(url, queryParameters:params);
    return handleDataSource(response);
  }

  Future getT(String url, {Map<String, dynamic> params}) async {
    var response = await dio.post(url, queryParameters: params);
    return response.data;
  }

  static  handleDataSource (Response response){
    int code = response.statusCode;
    if(code == 200){
      print(response.data);
      String res2Json  = json.encode(response.data);
      Map<String,dynamic> map=json.decode(res2Json);
      return map["data"];
    }
  }
}

