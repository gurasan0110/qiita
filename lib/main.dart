import 'package:flutter/material.dart';
import 'package:qiita/access_token_manager.dart';
import 'package:qiita/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AccessTokenManager.instance.accessTokenChanges.listen((accessToken) {
    debugPrint(accessToken);
  });

  await AccessTokenManager.instance.ensureInitialized();

  debugPrint(AccessTokenManager.instance.accessToken);

  runApp(const App());
}
