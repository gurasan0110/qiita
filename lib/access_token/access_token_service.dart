import 'package:qiita/access_token/access_token_repository.dart';

class AccessTokenService {
  final _repository = AccessTokenRepository();

  Future<String?> read() {
    return _repository.read();
  }

  Future<void> delete() async {
    await _repository.delete();
  }

  Future<void> write(String accessToken) async {
    await _repository.write(accessToken);
  }
}
