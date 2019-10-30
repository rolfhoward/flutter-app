import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//保存本地信息
class SharePreferencesUtils {

  factory SharePreferencesUtils() => getSharePreferencesInstance();
  static SharePreferencesUtils _preferencesInstance;
  static SharedPreferences _spf;

  SharePreferencesUtils._();

  static SharePreferencesUtils getSharePreferencesInstance() {
    if (null == _preferencesInstance) {
      _preferencesInstance = SharePreferencesUtils._();
      _preferencesInstance._init();
    }
    return _preferencesInstance;
  }

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  saveDynamicMap(String key, Map<String, dynamic> value) {
    if (_beforeCheck()) return null;
    var jsonStr = json.encode(value);
    _spf.setString(key, jsonStr);
  }

  dynamic getDynamic(String key) {
    var mapStr = _spf.getString(key);
    if (mapStr != null) {
      var map = json.decode(mapStr);
      return map;
    } else {
      return null;
    }
  }
}
