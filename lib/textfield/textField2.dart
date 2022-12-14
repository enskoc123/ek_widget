import 'package:flutter/material.dart';

class TextField2 extends StatelessWidget {

  Color? boxColor;
  Color? textColor;
  Color? hintTextColor;
  Color? iconColor;
  String? hintText;
  bool? isPassword;
  bool? isEmail;
  var controller = TextEditingController();
  IconData? icon;


  TextField2(
      {this.boxColor,
        this.textColor,
        this.hintTextColor,
        this.iconColor,
        this.hintText,
        required this.isPassword,
        required this.isEmail,
        required this.controller,
        this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28.0,left: 28),
      child: TextField(

        style: TextStyle(fontSize: 20.0),
        obscureText: isPassword!,
        keyboardType: isEmail! ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",

            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      ),
    );;
  }
}
