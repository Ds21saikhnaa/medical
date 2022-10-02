import 'package:shared_preferences/shared_preferences.dart';

class SpManager {
  late SharedPreferences sharedPreference;

  final String accessTokenKey = 'ACCESS_TOKEN';
  final String userRole = "ROLE";

  init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  // Access Token
  saveAccessToken(String token) async {
    await sharedPreference.setString(accessTokenKey, token);
  }

  saveRole(String role) async {
    await sharedPreference.setString(userRole, role);
  }

  delete() async {
    await sharedPreference.clear();
  }

  Future<String> getAccessToken() async {
    String? accessToken = sharedPreference.getString(accessTokenKey);
    return accessToken ?? '';
  }

  Future<String> getUserRole() async {
    String? role = sharedPreference.getString(userRole);
    return role ?? '';
  }
}
