import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccessTokenManager {
  AccessTokenManager._();

  static final instance = AccessTokenManager._();

  final _storage = const FlutterSecureStorage();
  final _key = 'ACCESS_TOKEN';

  String? _accessToken;

  String? get accessToken {
    return _accessToken;
  }

  Future<void> cache() async {
    _accessToken = await _storage.read(key: _key);
  }

  Future<void> delete() async {
    await _storage.delete(key: _key);
    await cache();
  }

  Future<void> write({required String accessToken}) async {
    await _storage.write(key: _key, value: accessToken);
    await cache();
  }
}
