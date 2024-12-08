import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qiita/access_token/access_token_cubit.dart';
import 'package:qiita/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) {
          return AccessTokenCubit();
        },
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
