import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageServices {
  static late SharedPreferences _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> srtStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }

  static List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }
}
