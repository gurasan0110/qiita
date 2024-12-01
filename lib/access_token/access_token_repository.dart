import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccessTokenRepository {
  final key = 'ACCESS_TOKEN';

  final _storage = FlutterSecureStorage();

  Future<String?> read() {
    return _storage.read(key: key);
  }

  Future<void> delete() async {
    await _storage.delete(key: key);
  }

  Future<void> write(String accessToken) async {
    await _storage.write(key: key, value: accessToken);
  }
}
