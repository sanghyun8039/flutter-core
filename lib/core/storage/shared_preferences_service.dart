import 'package:flutter_core/core/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements StorageService {
  late final SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> write(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  Future<String> read(String key) async {
    return _sharedPreferences.getString(key) ?? '';
  }

  @override
  Future<void> remove(String key) async {
    await _sharedPreferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
