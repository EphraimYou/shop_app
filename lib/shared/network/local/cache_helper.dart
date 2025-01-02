import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static Future init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  /* -------------------------------------------------------------------------- */
  /*                        set data in shared prefernces                       */
  /* -------------------------------------------------------------------------- */

  static Future<bool> saveData({required String key, required value}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is double) {
      return await sharedPreferences!.setDouble(key, value);
    } else {
      return await sharedPreferences!.setDouble(key, value);
    }
  }

/* -------------------------------------------------------------------------- */
/*                       get data from shared prefrences                      */
/* -------------------------------------------------------------------------- */

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeDate({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
}
