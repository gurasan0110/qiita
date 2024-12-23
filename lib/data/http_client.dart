import 'package:dio/dio.dart';
import 'package:qiita/utils/access_token_holder.dart';

class HttpClient with DioMixin implements Dio {
  HttpClient();

  @override
  BaseOptions get options {
    final baseUrl = 'https://qiita.com/api/v2';
    final accessToken = AccessTokenHolder().accessToken;
    final isNotNull = accessToken != null;
    final headers = {if (isNotNull) 'Authorization': 'Bearer $accessToken'};
    return BaseOptions(baseUrl: baseUrl, headers: headers);
  }

  @override
  HttpClientAdapter get httpClientAdapter {
    return HttpClientAdapter();
  }
}
