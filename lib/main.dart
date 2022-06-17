import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_two/screens/screen_home.dart';
import 'package:tutorial_two/screens/screen_login.dart';
import 'package:tutorial_two/screens/screen_signup.dart';
import 'package:tutorial_two/screens/screen_splash.dart';
import 'package:tutorial_two/utils/auth_controller.dart';
import 'package:tutorial_two/utils/routes.dart';
import 'package:tutorial_two/widgets/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
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
      routes: {
        MyRoutes.homeRoute: (context) => const HomeScreen(),
        MyRoutes.loginRoute: (context) => const LoginScreen(),
        MyRoutes.signupRoute: (context) => const SignupScreen(),
      },
    );
  }
}
