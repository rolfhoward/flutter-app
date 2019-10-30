import 'package:flutter_app/base/ResultModel.dart';
import 'package:flutter_app/base/api_config.dart';
import 'package:flutter_app/base/base_provider.dart';
import 'package:flutter_app/model/home/home_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeProvider extends BaseProvider{
  HomeModel _homeModel = HomeModel();
  var get_jellygarden_list = "/user/list";
  var get_publishNotice_list = "/publishNotice/list";

  //获取果冻花园首页数据
  Observable<ResultModel> loadJellyGardenList(int index, int page){
    Map<String, dynamic> param = {"page": page, "size": ApiConfig.BASE_PAGE_SIZE};
    return _homeModel.loadJellyGardenList(get_jellygarden_list, param);
  }

  //获取寂寞告白数据
  Observable<ResultModel> loadPublishNoticeList(int page){
    Map<String, dynamic> param = {"page": page, "size": ApiConfig.BASE_PAGE_SIZE};
    return _homeModel.loadPublishNoticeList(get_publishNotice_list, param);
  }
}