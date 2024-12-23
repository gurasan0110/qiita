import 'dart:async';

class AccessTokenHolder {
  AccessTokenHolder._();

  factory AccessTokenHolder() {
    return _instance;
  }

  static final _instance = AccessTokenHolder._();

  final _onChanged = StreamController<String?>.broadcast();

  Stream<String?> get onChanged {
    return _onChanged.stream;
  }

  String? _accessToken;

  String? get accessToken {
    return _accessToken;
  }

  set accessToken(String? accessToken) {
    if (_accessToken != accessToken) {
      _accessToken = accessToken;
      _onChanged.add(accessToken);
    }
  }
}
