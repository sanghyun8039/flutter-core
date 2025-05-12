import 'package:flutter_core/core/storage/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService implements StorageService {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String> read(String key) async {
    final result = await _secureStorage.read(key: key);
    if (result == null) {
      throw Exception('Key not found');
    }
    return result;
  }

  @override
  Future<void> remove(String key) async {
    await _secureStorage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}
