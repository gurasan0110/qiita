import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccessTokenManager {
  AccessTokenManager._();

  static final instance = AccessTokenManager._();

  final _storage = const FlutterSecureStorage();
  final _key = 'ACCESS_TOKEN';

  final _accessTokenChanges = StreamController<String?>.broadcast();

  String? _accessToken;

  Stream<String?> get accessTokenChanges {
    return _accessTokenChanges.stream;
  }

  String? get accessToken {
    return _accessToken;
  }

  Future<void> ensureInitialized() async {
    await _cache(shouldSend: false);
  }

  Future<void> delete() async {
    await _storage.delete(key: _key);
    await _cache();
  }

  Future<void> write({required String accessToken}) async {
    await _storage.write(key: _key, value: accessToken);
    await _cache();
  }

  Future<void> _cache({bool shouldSend = true}) async {
    final oldAccessToken = _accessToken;
    final newAccessToken = await _storage.read(key: _key);
    _accessToken = newAccessToken;
    if (shouldSend && oldAccessToken != newAccessToken) {
      _accessTokenChanges.add(newAccessToken);
    }
  }
}
