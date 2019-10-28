import 'package:flutter_app/base/ResultModel.dart';
import 'package:flutter_app/net/NetUtils.dart';
import 'package:rxdart/rxdart.dart';

class HomeModel{
  Observable<ResultModel> loadJellyGardenList(String url, Map<String, dynamic> param){
    return NetUtils.getInstance().post(url, queryParameters: param);
  }
}