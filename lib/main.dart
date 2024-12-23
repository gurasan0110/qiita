import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita/app.dart';
import 'package:qiita/data/services/access_token_service.dart';
import 'package:qiita/utils/access_token_holder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  final accessToken = await AccessTokenService().read();
  AccessTokenHolder().accessToken = accessToken;

  runApp(ProviderScope(child: const App()));
}
