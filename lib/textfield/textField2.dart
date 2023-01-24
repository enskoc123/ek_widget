import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullVariableTextField extends StatelessWidget {
  /// textfield ' ın arkaplan rengi
  Color? boxColor;
  /// yazılan yazı rengi
  Color? textColor;
  /// hinttext color
  Color? hintTextColor;
  /// son ek text in rengi
  Color? suffixTextColor;
  /// label text in rengi
  Color? labelTextColor;
  ///iconun rengi
  Color? iconColor;
  ///ön ek text in rengi
  Color? prefixTextColor;
  /// dış çemberin focused rengi
  Color? focusedBorderColor;
  ///Textfield ın dış çemberinin rengi
  Color? enabledBorderColor;
  ///textfield a tıklanadan önce dış çemberin köşe ovallik oranı
  double? enabledBorderRadius;
  ///textfield a tıklanıp focuslandıktan sonra dış çemberin köşe ovallik oranı
  double? focusedBorderRadius;
/// hinttext in yazısı
  String? hintText;
  ///label text
  String? labelText;
  /// ön ek yazısı
  String? prefixText;
/// son ek yazısı
  String? suffixText;

  var controller = TextEditingController();
  IconData? icon;
/// maximum karakter sayısı
  int? maxLength;


  FullVariableTextField(
      {this.boxColor,
        this.textColor,
        this.hintTextColor,
        this.labelTextColor,
        this.iconColor,
        this.prefixTextColor,
        this.enabledBorderColor,
        this.focusedBorderColor,
        this.enabledBorderRadius,
        this.focusedBorderRadius,
        this.suffixTextColor,
        this.suffixText,
        this.hintText,
        this.labelText,
        this.prefixText,
        required this.controller,
        this.icon,
        this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
          iconColor:iconColor ?? Colors.black,
          fillColor:boxColor ?? Colors.white,
          focusColor: Colors.black,
          hoverColor: Colors.black,
          filled: true,
          hintText:hintText,
          suffixText: suffixText,
          suffixStyle: TextStyle(color:suffixTextColor ?? Colors.black ),
          labelText:labelText,
          prefixText: prefixText,
          icon: Icon(icon ?? Icons.terrain_outlined,color:iconColor ?? Colors.black),
          labelStyle: TextStyle(color:labelTextColor ?? Colors.black),
          prefixStyle: TextStyle(color:prefixTextColor ?? Colors.black),
          hintStyle: TextStyle(color:hintTextColor ?? Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(width: 3, color:focusedBorderColor ?? Colors.black),
            borderRadius:BorderRadius.circular(focusedBorderRadius ?? 25.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(enabledBorderRadius ?? 30.0),
            borderSide: BorderSide(width: 3, color:enabledBorderColor ?? Colors.black), //<-- SEE HERE
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        onSaved: (value) {

        },
        maxLength:maxLength ?? 10,
        maxLengthEnforcement: MaxLengthEnforcement.none,

        // TextInputFormatters are applied in sequence.

      ),
    );
  }
}
