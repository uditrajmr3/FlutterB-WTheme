import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final String label;
  final String prefixiconCode;
  final String prefixiconfamily;
  final String suffixiconCode;
  final String suffixiconfamily;
  final String textFieldController;
  final bool obscuretext;

  const TextFieldWidget(
      {super.key,
      this.hint = "",
      this.label = "",
      this.prefixiconCode = "",
      this.prefixiconfamily = "MaterialIcons",
      this.suffixiconCode = "",
      this.suffixiconfamily = "",
      this.textFieldController = "",
      this.obscuretext = false});

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
      child: TextField(
        style: TextStyle(
            color: context.theme.cardColor,
            fontFamily: GoogleFonts.syne().fontFamily),
        decoration: InputDecoration(
          fillColor: context.theme.scaffoldBackgroundColor,
          focusColor: context.theme.scaffoldBackgroundColor,
          iconColor: context.theme.scaffoldBackgroundColor,
          prefixIcon: Icon(
            IconData(int.parse(prefixiconCode), fontFamily: prefixiconfamily),
          ),
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
          hintText: hint,
        ),
        obscureText: obscuretext,
      ),
    );
  }
}
