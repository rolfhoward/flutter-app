import 'package:flutter_app/base/ResultModel.dart';
import 'package:flutter_app/base/api_config.dart';
import 'package:flutter_app/base/base_provider.dart';
import 'package:flutter_app/model/home/home_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeProvider extends BaseProvider{
  HomeModel _homeModel = HomeModel();
  var get_jellygarden_list = "/user/list";

  Observable<ResultModel> loadJellyGardenList(int page){
    Map<String, dynamic> param = {"page": page, "size": ApiConfig.BASE_PAGE_SIZE};
    return _homeModel.loadJellyGardenList(get_jellygarden_list, param);
  }
}