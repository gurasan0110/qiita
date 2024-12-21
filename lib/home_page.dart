import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita/access_token/access_token_exists_notifier/access_token_exists_notifier.dart';
import 'package:qiita/access_token/access_token_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              final accessTokenExists =
                  ref.watch(accessTokenExistsNotifierProvider);
              return Text(accessTokenExists.toString());
            }),
            TextButton(
              onPressed: () async {
                await AccessTokenManager.instance.delete();
              },
              child: Text('delete'),
            ),
            TextButton(
              onPressed: () async {
                await AccessTokenManager.instance
                    .write(accessToken: 'accessToken');
              },
              child: Text('write'),
            ),
          ],
        ),
      ),
    );
  }
}
