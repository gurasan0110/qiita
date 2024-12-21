import 'package:flutter/material.dart';
import 'package:qiita/access_token_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                debugPrint(AccessTokenManager.instance.accessToken);
              },
              child: Text('accessToken'),
            ),
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
