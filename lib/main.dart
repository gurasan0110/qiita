import 'package:flutter/material.dart';
import 'package:qiita/access_token_manager.dart';
import 'package:qiita/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AccessTokenManager.instance.cache();

  runApp(const App());
}
