import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tutorial_two/screen_home.dart';

void main() {
  runApp(const TutorialTwo());
}

class TutorialTwo extends StatelessWidget {
  const TutorialTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: HomeScreen(),
      ),
    );
  }
}
