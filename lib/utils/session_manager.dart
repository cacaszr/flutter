import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  Future<void> saveSession(String accessToken) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(AppConstants.tokenKey, accessToken);
  }

  Future<String> getAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    final accessToken = pref.getString(AppConstants.tokenKey);
    return accessToken ?? '';
  }

  Future<void> removeAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(AppConstants.tokenKey);
  }
}