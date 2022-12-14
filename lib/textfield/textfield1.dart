import 'package:flutter/material.dart';

class Textfield1 extends StatelessWidget {

  Color? boxColor;
  Color? textColor;
  Color? hintTextColor;
  Color? iconColor;
  String? hintText;
  bool? isPassword;
  bool? isEmail;
  var controller = TextEditingController();
  IconData? icon;


  Textfield1(
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
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color:boxColor ?? Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color:textColor ?? Colors.black.withOpacity(.8)),
        obscureText: isPassword!,
        keyboardType: isEmail! ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color:iconColor ?? Colors.black.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
          TextStyle(fontSize: 14, color:hintTextColor ?? Colors.black.withOpacity(.5)),
        ),
      ),
    );
  }
}
