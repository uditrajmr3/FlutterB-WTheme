import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_two/screens/screen_home.dart';
import 'package:tutorial_two/screens/screen_login.dart';
import 'package:tutorial_two/utils/user_profile.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  static AuthController instance =
      Get.find(); // auth controller instance; will be called in other widgets
  // user instance
  late Rx<User?> _user;
  // get user data like name, email, password etc
  FirebaseAuth auth = FirebaseAuth.instance; // firebase auth instance

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); // getting current user
    _user.bindStream(
      auth.userChanges(),
    ); //notifies app about user login and logout

    ever(_user,
        _initialScreen); //this funnction will make sure user gets to correct screen
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  Future<void> register(
      BuildContext context, String email, username, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Future.delayed(
          const Duration(
            seconds: 1,
          ), () {
        userSetup(username, email, password);

        VxToast.show(context,
            msg: "Registration Successful",
            bgColor: Colors.green.shade100,
            textColor: Colors.green.shade500,
            textSize: 14,
            position: VxToastPosition.center);
      });
    } catch (e) {
      VxToast.show(context,
          msg: "Error: $e",
          bgColor: Colors.red.shade100,
          textColor: Colors.red.shade500,
          textSize: 14,
          position: VxToastPosition.center);
    }
  }

  Future<void> login(BuildContext context, String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      //await Future.delayed(const Duration(seconds: 2));
      Future.delayed(
          const Duration(
            seconds: 1,
          ), () {
        VxToast.show(context,
            msg: "Login Successful",
            bgColor: Colors.green.shade100,
            textColor: Colors.green.shade500,
            textSize: 14,
            position: VxToastPosition.center);
      });
    } catch (e) {
      VxToast.show(context,
          msg: "Error: $e",
          bgColor: Colors.red.shade100,
          textColor: Colors.red.shade500,
          textSize: 14,
          position: VxToastPosition.center);
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context,
          msg: "Error: $e",
          bgColor: Colors.red.shade100,
          textColor: Colors.red.shade500,
          textSize: 14,
          position: VxToastPosition.center);
    }
  }
}
