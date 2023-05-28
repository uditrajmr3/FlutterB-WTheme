// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_two/screens/screen_profile.dart';
import 'package:tutorial_two/utils/auth_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userData = "loading...";

  void getUserData(BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference users = firestore.collection('Users');

    FirebaseAuth auth = FirebaseAuth.instance;

    String uid = auth.currentUser!.email.toString();
    print(uid);
    users.doc(uid).get().then((value) {
      setState(() {
        userData = value['username'].toString();
        //print("snapshot value: $userData");
      });
    }).onError((error, stackTrace) {
      userData = "Something went wrong... $error";
    });
  }

  @override
  void initState() {
    setState(() {
      getUserData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const Text(
                  "Welcome Home",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(userData.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ], borderRadius: BorderRadius.circular(40)),
                  child: ElevatedButton(
                    onPressed: () {
                      AuthController.instance.logOut(context);
                    },
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(
                          context.theme.scaffoldBackgroundColor),
                    ),
                    child: const Text("Logout"),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ], borderRadius: BorderRadius.circular(40)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    },
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(
                          context.theme.scaffoldBackgroundColor),
                    ),
                    child: const Text("Profile"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
