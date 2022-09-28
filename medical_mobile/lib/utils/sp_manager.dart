import 'package:shared_preferences/shared_preferences.dart';

class SpManager {
  late SharedPreferences sharedPreference;

  final String accessTokenKey = 'ACCESS_TOKEN';

  init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  // Access Token
  saveAccessToken(String token) async {
    await sharedPreference.setString(accessTokenKey, token);
  }

  delete() async {
    await sharedPreference.clear();
  }

  Future<String> getAccessToken() async {
    String? accessToken = sharedPreference.getString(accessTokenKey);
    return accessToken ?? '';
  }
}
