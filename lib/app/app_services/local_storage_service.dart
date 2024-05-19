import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  static dynamic getFromDisk(String key) {
    try {
      var value = _sharedPreferences.get(key);
      print(
          '\n\n\n\n\n (TRACE) LocalStorageService:_getFromDisk. key: $key value: $value /n');
      return value;
    } catch (err) {
      print(
          '\n\n\n\n\n (ERROR) LocalStorageService:_getFromDisk. key: $key error: $err /n');
      return null;
    }
  }

  static void saveToDisk<T>(String key, T content) {
    print(
        '\n\n\n\n\n(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content /n');
    if (content is String) {
      _sharedPreferences.setString(key, content);
    }
    if (content is bool) {
      _sharedPreferences.setBool(key, content);
    }
    if (content is int) {
      _sharedPreferences.setInt(key, content);
    }
    if (content is double) {
      _sharedPreferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _sharedPreferences.setStringList(key, content);
    }
  }

  static void clearDisk() {
    _sharedPreferences.clear();
  }
}
