import 'package:hive/hive.dart';

import '../utils/sp_manager.dart';

class RestApiHelper {
  static Box? authBox;

  static const String kAccessToken = "ACCESS_TOKEN";
  static const String kAppIntro = "APP_INTRODUCTION";
  static const String kUserName = "USER_NAME";
  static const String kPassword = "PASSWORD";

  /// Access Token хадгалах болон авах
  static void saveAccessToken(String token) async {
    SpManager sharedPreference = SpManager();
    await sharedPreference.init();
    sharedPreference.saveAccessToken(token);
  }
  //authBox?.put(kAccessToken, token);

  static Future<String> getAccessToken() async {
    SpManager sharedPreference = SpManager();
    await sharedPreference.init();
    return await sharedPreference.getAccessToken();
  }
}
