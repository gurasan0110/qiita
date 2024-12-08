import 'package:qiita/access_token/access_token_provider.dart';

class AccessTokenRepository {
  const AccessTokenRepository();

  final _provider = const AccessTokenProvider();

  Future<String?> read() {
    return _provider.read();
  }

  Future<void> delete() async {
    await _provider.delete();
  }

  Future<void> write({required String accessToken}) async {
    await _provider.write(accessToken: accessToken);
  }
}
