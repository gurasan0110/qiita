import 'package:qiita/utils/access_token_holder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'access_token_is_not_null_notifier_provider.g.dart';

@Riverpod(keepAlive: true)
class AccessTokenIsNotNullNotifier extends _$AccessTokenIsNotNullNotifier {
  AccessTokenIsNotNullNotifier();

  final _holder = AccessTokenHolder();

  @override
  bool build() {
    _holder.onChanged.listen((accessToken) {
      state = accessToken != null;
    });

    return _holder.accessToken != null;
  }
}
