import 'package:flutter/material.dart';
import 'package:qiita/ui/widgets/home/widgets/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff55c500)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
