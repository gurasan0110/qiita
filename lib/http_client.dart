import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qiita/access_token/access_token_manager.dart';

class HttpClient with DioMixin implements Dio {
  HttpClient();

  @override
  BaseOptions get options {
    final accessToken = AccessTokenManager.instance.accessToken;
    final accessTokenExists = accessToken != null;
    debugPrint(accessToken);
    return BaseOptions(
      baseUrl: 'https://qiita.com/api/v2',
      headers: {
        if (accessTokenExists) 'Authorization': 'Bearer $accessToken',
      },
    );
  }

  @override
  HttpClientAdapter get httpClientAdapter {
    return HttpClientAdapter();
  }
}
