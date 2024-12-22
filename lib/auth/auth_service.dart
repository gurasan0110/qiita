import 'package:flutter/foundation.dart';
import 'package:qiita/access_token/access_token_manager.dart';
import 'package:qiita/auth/auth_repository.dart';

class AuthService {
  AuthService();

  final _repository = AuthRepository();
  final _manager = AccessTokenManager.instance;

  Future<void> auth() async {
    final code = await _repository.authorize();
    if (code == null) {
      debugPrint('code == null');
      return;
    }
    debugPrint(code);
    final accessToken = await _repository.postAccessTokens(code: code);
    debugPrint(accessToken);
    await _manager.write(accessToken: accessToken);
  }

  Future<void> revoke() async {
    final accessToken = _manager.accessToken;
    if (accessToken == null) {
      debugPrint('accessToken == null');
      return;
    }
    final success =
        await _repository.deleteAccessTokens(accessToken: accessToken);
    if (!success) {
      debugPrint('!success');
      return;
    }
    await _manager.delete();
  }
}
