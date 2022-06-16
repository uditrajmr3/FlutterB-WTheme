// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(child: Text("Welcome Home")),
      ),
    );
  }
}
