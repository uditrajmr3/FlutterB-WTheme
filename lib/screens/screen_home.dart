// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const Text(
                  "Welocme Home",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(
                  "csense2653@gmail.com",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[350],
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
                    onPressed: () {},
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(
                          context.theme.scaffoldBackgroundColor),
                    ),
                    child: const Text("Logout"),
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
