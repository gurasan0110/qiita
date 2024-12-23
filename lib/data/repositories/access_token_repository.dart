import 'dart:async';

import 'package:flutter/material.dart';
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
    debugPrint('code: $code');
    if (code == null) {
      debugPrint('code == null');
      return;
    }

    final accessToken = await _accessTokenService.postAccessTokens(code: code);
    debugPrint('accessToken: $accessToken');

    await _accessTokenService.write(accessToken: accessToken);

    _holder.accessToken = accessToken;
  }

  Future<void> revoke() async {
    final accessToken = _holder.accessToken;
    debugPrint('accessToken: $accessToken');
    if (accessToken == null) {
      debugPrint('accessToken == null');
      return;
    }

    final isSuccess = await _accessTokenService.deleteAccessTokens(
      accessToken: accessToken,
    );
    if (!isSuccess) {
      debugPrint('!isSuccess');
      return;
    }

    await _accessTokenService.delete();

    _holder.accessToken = null;
  }
}
