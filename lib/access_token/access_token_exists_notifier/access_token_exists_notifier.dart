import 'package:qiita/access_token/access_token_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'access_token_exists_notifier.g.dart';

@Riverpod(keepAlive: true)
class AccessTokenExistsNotifier extends _$AccessTokenExistsNotifier {
  AccessTokenExistsNotifier();

  final _manager = AccessTokenManager.instance;

  @override
  bool build() {
    _manager.accessTokenChanges.listen((accessToken) {
      state = _exists(accessToken: accessToken);
    });

    return _exists(accessToken: _manager.accessToken);
  }

  bool _exists({required String? accessToken}) {
    return accessToken != null;
  }
}
