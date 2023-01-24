import 'package:flutter/material.dart';
/// Açıklama metinleri , not ve benzeri geniş alanlarda yazı yazabilme imkanı sağlayan kapsamlı bir textfield
class DescriptionTextField extends StatelessWidget {
  /// textfieldın arka plan rengi
  Color? boxColor;
  /// yazılan textin rengi
  Color? textColor;
  /// hinttext rengi
  Color? hintTextColor;
/// son ek yazısının rengi
  Color? suffixTextColor;
  ///label yazısının rengi
  Color? labelTextColor;
  ///icon rengi
  Color? iconColor;
  ///ön ek text rengi
  Color? prefixTextColor;
  /// dış çemberin focused rengi
  Color? focusedBorderColor;
  ///Textfield ın dış çemberinin rengi
  Color? enabledBorderColor;
  ///textfield a tıklanadan önce dış çemberin köşe ovallik oranı
  double? enabledBorderRadius;
  ///textfield a tıklanıp focuslandıktan sonra dış çemberin köşe ovallik oranı
  double? focusedBorderRadius;
  /// hinttext yazisi
  String? hintText;
  String? labelText;
  /// textfield in başında solda bulunan text
  String? prefixText;
  ///Textfiel ın sağında kalan text
  String? suffixText;

  var controller = TextEditingController();
  IconData? icon;
  TextAlign? textAlign;
  int? maxLines;


  DescriptionTextField(
      {this.boxColor,
      this.textColor,
      this.hintTextColor,
      this.suffixTextColor,
      this.labelTextColor,
      this.iconColor,
      this.prefixTextColor,
      this.focusedBorderColor,
      this.enabledBorderColor,
      this.enabledBorderRadius,
      this.focusedBorderRadius,
      this.hintText,
      this.labelText,
      this.prefixText,
      this.suffixText,
      required this.controller,
      this.icon,
      this.maxLines,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0,left: 18.0),
      child: TextFormField(
        restorationId: 'life_story_field',
        textAlign:textAlign ?? TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
          fillColor:boxColor ?? Colors.white,
          focusColor: Colors.green,
          hoverColor: Colors.white,
          filled: true,
          hintText:hintText,
          suffixText: suffixText,
          suffixStyle: TextStyle(color:suffixTextColor ?? Colors.black ),
          labelText:labelText,
          prefixText: prefixText,
          labelStyle: TextStyle(color:labelTextColor ?? Colors.black),
          prefixStyle: TextStyle(color:prefixTextColor ?? Colors.black),
          hintStyle: TextStyle(color:hintTextColor ?? Colors.black38),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(width: 3, color:focusedBorderColor ?? Colors.black),
            borderRadius:BorderRadius.circular(focusedBorderRadius ?? 25.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(enabledBorderRadius ?? 30.0),
            borderSide: BorderSide(width: 3, color:enabledBorderColor ?? Colors.black), //<-- SEE HERE
          ),
        ),
        maxLines: maxLines ?? 5  ,
      ),
    );
  }
}
