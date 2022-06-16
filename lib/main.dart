import 'package:flutter/material.dart';
import 'package:tutorial_two/screens/screen_splash.dart';
import 'package:tutorial_two/widgets/themes.dart';

void main() {
  runApp(const TutorialTwo());
}

class TutorialTwo extends StatelessWidget {
  const TutorialTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
