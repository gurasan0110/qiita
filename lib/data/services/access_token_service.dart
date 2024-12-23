import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qiita/data/http_client.dart';
import 'package:qiita/utils/constants/client.dart';

class AccessTokenService {
  AccessTokenService();

  final _client = HttpClient();

  final _storage = const FlutterSecureStorage();
  final _key = 'ACCESS_TOKEN';

  Future<String> postAccessTokens({required String code}) async {
    final data = {
      'client_id': Client.id,
      'client_secret': Client.secret,
      'code': code,
    };

    final response = await _client.post('/access_tokens', data: data);
    final accessToken = response.data['token'] as String?;
    if (accessToken == null) {
      throw Exception('accessToken == null');
    }

    return accessToken;
  }

  Future<void> deleteAccessTokens({required String accessToken}) async {
    final response = await _client.delete('/access_tokens/$accessToken');
    if (response.statusCode != 204) {
      throw Exception('response.statusCode != 204');
    }
  }

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
