import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qiita/access_token/access_token_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BlocProvider(
            create: (context) {
              return AccessTokenCubit();
            },
            child: Builder(builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<AccessTokenCubit, String?>(
                    builder: (context, state) {
                      return Text(state ?? 'Null');
                    },
                  ),
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
              );
            }),
          ),
        ),
      ),
    );
  }
}
