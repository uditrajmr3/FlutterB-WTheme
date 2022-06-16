// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:tutorial_two/widgets/widget_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: const [
              Text("Welcome Home"),
            ],
          ),
        ),
      ),
    );
  }
}
