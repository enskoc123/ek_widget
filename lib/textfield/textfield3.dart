import 'package:flutter/material.dart';

class TextField3 extends StatelessWidget {
  Color? boxColor;
  Color? textColor;
  Color? hintTextColor;
  Color? suffixiconColor;
  Color? prefixIconColor;
  String? hintText;
  bool? isPassword;
  bool? isEmail;
  var controller = TextEditingController();
  IconData? prefixIcon;
  IconData? suffixIcon;

  var suffixIconOnTab;

  TextField3(
      {this.boxColor,
      this.textColor,
      this.hintTextColor,
      this.prefixIconColor,
      this.suffixiconColor,
      this.hintText,
      required this.isPassword,
      required this.isEmail,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconOnTab});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: boxColor ?? Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: textColor ?? Colors.black.withOpacity(.8)),
        obscureText: isPassword!,
        keyboardType:
            isEmail! ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: prefixIconColor ?? Colors.black.withOpacity(.7),
          ),
          suffixIcon: GestureDetector(
            child: Icon(
              suffixIcon,
              color: suffixiconColor,
            ),
            onTap: () {
              suffixIconOnTab();
            },
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 14,
              color: hintTextColor ?? Colors.black.withOpacity(.5)),
        ),
      ),
    );
  }
}
