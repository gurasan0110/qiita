import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita/access_token/access_token_manager.dart';
import 'package:qiita/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AccessTokenManager.instance.ensureInitialized();

  runApp(ProviderScope(child: const App()));
}
