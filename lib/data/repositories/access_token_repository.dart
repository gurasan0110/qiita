import 'dart:async';

import 'package:qiita/data/services/access_token_service.dart';
import 'package:qiita/data/services/auth_service.dart';
import 'package:qiita/utils/access_token_holder.dart';

class AccessTokenRepository {
  AccessTokenRepository();

  final _holder = AccessTokenHolder();

  final _accessTokenService = AccessTokenService();
  final _authService = const AuthService();

  Future<void> issue() async {
    final code = await _authService.authorize();
    final accessToken = await _accessTokenService.postAccessTokens(code: code);
    await _accessTokenService.write(accessToken: accessToken);
    _holder.accessToken = accessToken;
  }

  Future<void> revoke() async {
    final accessToken = _holder.accessToken!;
    await _accessTokenService.deleteAccessTokens(accessToken: accessToken);
    await _accessTokenService.delete();
    _holder.accessToken = null;
  }
}
