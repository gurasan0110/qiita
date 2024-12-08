import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qiita/access_token/access_token_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AccessTokenCubit, String?>(builder: (context, state) {
              return Text(state ?? 'Null');
            }),
            TextButton(
              onPressed: () async {
                await context.read<AccessTokenCubit>().delete();
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () async {
                await context
                    .read<AccessTokenCubit>()
                    .write(accessToken: 'accessToken');
              },
              child: Text('Write'),
            ),
          ],
        ),
      ),
    );
  }
}
