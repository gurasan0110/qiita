import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccessTokenRepository {
  const AccessTokenRepository();

  final _storage = const FlutterSecureStorage();
  final _key = 'ACCESS_TOKEN';

  Future<String?> read() {
    return _storage.read(key: _key);
  }

  Future<void> delete() async {
    await _storage.delete(key: _key);
  }

  Future<void> write({required String accessToken}) async {
    await _storage.write(key: _key, value: accessToken);
  }
}
