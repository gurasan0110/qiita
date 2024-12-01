import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita/app.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(ProviderScope(child: const App()));
}
