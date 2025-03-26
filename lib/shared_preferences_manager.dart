import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String _apiKey = 'apiKey';
  static const String isFirstTimeKey = 'isFirstTime';

  static Future<void> setFirstTime(bool isFirstTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isFirstTimeKey, isFirstTime);
  }

  static Future<bool> getFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isFirstTimeKey) ?? true;
  }

  static Future<void> setApiKey(String apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_apiKey, apiKey);
  }

  static Future<String?> getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_apiKey);
  }
}
