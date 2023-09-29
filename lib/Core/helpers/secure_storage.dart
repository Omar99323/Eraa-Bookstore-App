import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static FlutterSecureStorage? storage;
  static init() {
    storage = const FlutterSecureStorage();
  }

  static writeData({
    required String key,
    required dynamic value,
  }) async {
    await storage!.write(key: key, value: value);
  }

  static getData({
    required String key,
  }) async {
    return await storage!.read(key: key);
  }

  static deleteData({
    required String key,
  }) async {
    await storage!.delete(key: key);
  }
}
