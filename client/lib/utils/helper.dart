import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static Future<List<String>?> getPreference(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  static Future<void> setPreference(String key, List<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, data);
  }

  static Future<void> deletePreference(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static bool checkNrp(String nrp) {
    List<String> list = ['3121600028'];
    for (var element in list) {
      if (element == nrp) {
        return true;
      }
    }
    return false;
  }
}