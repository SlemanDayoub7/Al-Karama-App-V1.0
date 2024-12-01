import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DataType {
  INT,
  STRING,
  BOOL,
  DOUBLE,
  LISTSTRING,
}

class SharedPrefrenceRepository {
  SharedPreferences pref = Get.find<SharedPreferences>();

  //!---- Keys  ------

  String PREF_APP_LANG = 'app_language';
  String PREF_GAME_TYPE = 'game_type';
  String PREF_SPORT_TYPE = 'sport_type';
  void setAppLanguage(String code) {
    setPrefrenc(type: DataType.STRING, key: PREF_APP_LANG, value: code);
  }

  void setSportType(String type) {
    setPrefrenc(type: DataType.STRING, key: PREF_SPORT_TYPE, value: type);
  }

  String getSportType() {
    if (pref.containsKey(PREF_SPORT_TYPE)) {
      return getPrefrence(PREF_SPORT_TYPE);
    } else {
      return "";
    }
  }

  void setGameType(String type) {
    setPrefrenc(type: DataType.STRING, key: PREF_GAME_TYPE, value: type);
  }

  String getGameType() {
    if (pref.containsKey(PREF_GAME_TYPE)) {
      return getPrefrence(PREF_GAME_TYPE);
    } else {
      return "Foot";
    }
  }

  String getAppLanguage() {
    if (pref.containsKey(PREF_APP_LANG)) {
      return getPrefrence(PREF_APP_LANG);
    } else {
      return 'ar';
    }
  }

  //*====================================

  void setPrefrenc({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.INT:
        await pref.setInt(key, value);
        break;
      case DataType.STRING:
        await pref.setString(key, value);
        break;
      case DataType.BOOL:
        await pref.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await pref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrence(String key) {
    return pref.get(key);
  }

  getTokenInfo() {}
}
