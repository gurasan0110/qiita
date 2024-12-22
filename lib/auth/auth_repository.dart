import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:qiita/client.dart';
import 'package:qiita/http_client.dart';
import 'package:uuid/uuid.dart';

class AuthRepository {
  AuthRepository();

  final _client = HttpClient();

  Future<String?> authorize() async {
    final scope = 'read_qiita write_qiita';
    final requestState = Uuid().v4();
    final endpoint = '${_client.options.baseUrl}/oauth/authorize';
    final urlString = await FlutterWebAuth2.authenticate(
      url: '$endpoint?client_id=${Client.id}&scope=$scope&state=$requestState',
      callbackUrlScheme: 'qiita',
    );
    final url = Uri.parse(urlString);
    final responseState = url.queryParameters['state'];
    if (requestState != responseState) {
      debugPrint('requestState != responseState');
      return null;
    }
    return url.queryParameters['code'];
  }

  Future<String> postAccessTokens({required String code}) async {
    final data = {
      'client_id': Client.id,
      'client_secret': Client.secret,
      'code': code,
    };
    final response = await _client.post('/access_tokens', data: data);
    return response.data['token'];
  }

  Future<bool> deleteAccessTokens({required String accessToken}) async {
    final response = await _client.delete('/access_tokens/$accessToken');
    return response.statusCode == 204;
  }
}
