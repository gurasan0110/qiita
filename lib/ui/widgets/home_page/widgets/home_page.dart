import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita/data/repositories/access_token_repository.dart';
import 'package:qiita/gen/assets.gen.dart';
import 'package:qiita/ui/providers/access_token_is_not_null_notifier_provider/access_token_is_not_null_notifier_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Assets.images.logo.image(height: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              final accessTokenIsNotNull = ref.watch(
                accessTokenIsNotNullNotifierProvider,
              );
              return Text(accessTokenIsNotNull.toString());
            }),
            TextButton(
              onPressed: () async {
                await AccessTokenRepository().issue();
              },
              child: Text('issue'),
            ),
            TextButton(
              onPressed: () async {
                await AccessTokenRepository().revoke();
              },
              child: Text('revoke'),
            ),
          ],
        ),
      ),
    );
  }
}
