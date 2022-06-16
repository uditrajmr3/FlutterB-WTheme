import 'package:flutter/material.dart';
import 'package:tutorial_two/screens/screen_splash.dart';

void main() {
  runApp(const TutorialTwo());
}

class TutorialTwo extends StatelessWidget {
  const TutorialTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
