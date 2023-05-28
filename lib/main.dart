import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_two/screens/screen_home.dart';
import 'package:tutorial_two/screens/screen_login.dart';
import 'package:tutorial_two/screens/screen_profile.dart';
import 'package:tutorial_two/screens/screen_signup.dart';
import 'package:tutorial_two/screens/screen_splash.dart';
import 'package:tutorial_two/utils/auth_controller.dart';
import 'package:tutorial_two/utils/routes.dart';
import 'package:tutorial_two/utils/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const TutorialTwo());
}

class TutorialTwo extends StatelessWidget {
  const TutorialTwo({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      //initialRoute: '/',
      routes: {
        //'/': (context) => const SplashScreen(),
        MyRoutes.homeRoute: (context) => const HomeScreen(),
        MyRoutes.loginRoute: (context) => const LoginScreen(),
        MyRoutes.signupRoute: (context) => const SignupScreen(),
        MyRoutes.profileRoute: (context) => const ProfileScreen(),
      },
    );
  }
}
