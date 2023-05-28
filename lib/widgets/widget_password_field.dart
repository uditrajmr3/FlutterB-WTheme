// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController passwordFieldController;
  const PasswordFieldWidget({
    Key? key,
    required this.passwordFieldController,
  }) : super(key: key);

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: const Offset(1, 1),
              color: context.theme.canvasColor.withOpacity(0.3),
            ),
          ]),
      child: TextFormField(
        controller: widget.passwordFieldController,
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: context.theme.scaffoldBackgroundColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: context.theme.scaffoldBackgroundColor, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(obscureText
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded),
          ),
          prefixIcon: const Icon(Icons.password_rounded),
          hintText: "Enter Password",
        ),
      ),
    );
  }
}
