import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita/access_token/access_token_service.dart';

final accessTokenProvider = StateNotifierProvider<AccessTokenNotifier, String?>(
  AccessTokenNotifier.new,
);

class AccessTokenNotifier extends StateNotifier<String?> {
  AccessTokenNotifier(this._ref) : super(null) {
    Future(() async {
      state = await _service.read();
    });
  }

  final Ref _ref;

  final _service = AccessTokenService();

  Future<void> delete() async {
    await _service.delete();
    _ref.invalidateSelf();
  }

  Future<void> write(String accessToken) async {
    await _service.write(accessToken);
    _ref.invalidateSelf();
  }
}
