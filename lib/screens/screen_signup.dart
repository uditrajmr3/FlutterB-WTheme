import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutorial_two/utils/auth_controller.dart';
import 'package:tutorial_two/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/widget_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/flutter_logo_modified.png",
                height: 200,
                width: 200,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello There",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "We are glad to welcome you here",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFieldWidget(
                      hint: "Enter E-mail",
                      obscuretext: false,
                      prefixiconCode: "0xe22a",
                      prefixiconfamily: "MaterialIcons",
                      textFieldController: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      hint: "Enter Username",
                      obscuretext: false,
                      prefixiconCode: "0xf01f3",
                      prefixiconfamily: "MaterialIcons",
                      textFieldController: usernameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      hint: "Enter Password",
                      obscuretext: true,
                      prefixiconCode: "0xf0050",
                      prefixiconfamily: "MaterialIcons",
                      textFieldController: passwordController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[500],
                                fontFamily: GoogleFonts.syne().fontFamily,
                              ),
                            ),
                            TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: context.theme.cardColor,
                                  fontFamily: GoogleFonts.syne().fontFamily,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                        context, MyRoutes.loginRoute);
                                  }),
                          ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
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
                    //AuthController.instance.register(email, username, password)
                  },
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(
                        context.theme.scaffoldBackgroundColor),
                  ),
                  child: const Text("Signup"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
