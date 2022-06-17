import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_two/screens/screen_login.dart';
import 'package:velocity_x/velocity_x.dart';

import '../screens/screen_home.dart';

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

  void register(String email, username, password) {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("About User", "User Message",
          backgroundColor: Colors.greenAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Registration Successful",
            style: TextStyle(color: Colors.white),
          ),
          messageText: const Text(
            "Congratulations on joining us.",
            style: TextStyle(color: Colors.white),
          ));
    } catch (e) {
      //VxToast.show(context, msg: "Error occured while registration");
      Get.snackbar("About User", "User Message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Registration Failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }
}
