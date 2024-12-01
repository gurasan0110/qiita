import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita/access_token/access_token_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(accessTokenProvider) ?? 'Null'),
            TextButton(
              onPressed: () async {
                await ref.read(accessTokenProvider.notifier).delete();
              },
              child: Text('delete'),
            ),
            TextButton(
              onPressed: () async {
                await ref
                    .read(accessTokenProvider.notifier)
                    .write('accessToken');
              },
              child: Text('write'),
            ),
          ],
        ),
      ),
    );
  }
}
