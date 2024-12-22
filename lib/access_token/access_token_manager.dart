import 'dart:async';

import 'package:qiita/access_token/access_token_repository.dart';

class AccessTokenManager {
  AccessTokenManager._();

  static final instance = AccessTokenManager._();

  final _repository = const AccessTokenRepository();
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
    await _repository.delete();
    await _cache();
  }

  Future<void> write({required String accessToken}) async {
    await _repository.write(accessToken: accessToken);
    await _cache();
  }

  Future<void> _cache({bool shouldSend = true}) async {
    final oldAccessToken = _accessToken;
    final newAccessToken = await _repository.read();
    _accessToken = newAccessToken;
    if (shouldSend && oldAccessToken != newAccessToken) {
      _accessTokenChanges.add(newAccessToken);
    }
  }
}
