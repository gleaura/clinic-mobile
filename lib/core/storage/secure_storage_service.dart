import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _tokenKey = 'access_token';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    if (kIsWeb) {
      return null; // Web desteği gerekirse dart:html ile eklenebilir
    }
    return _storage.read(key: _tokenKey);
  }

  Future<void> setToken(String token) async {
    if (kIsWeb) return;
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> clearToken() async {
    if (kIsWeb) return;
    await _storage.delete(key: _tokenKey);
  }
}
