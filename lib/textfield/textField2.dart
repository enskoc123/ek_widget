import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullVariableTextField extends StatelessWidget {
  Color? boxColor;
  Color? textColor;
  Color? hintTextColor;
  Color? suffixTextColor;
  Color? labelTextColor;
  Color? iconColor;
  Color? prefixTextColor;
  Color? focusedBorderColor; // dış çemberin focused rengi
  Color? enabledBorderColor;//Textfield ın dış çemberinin rengi
  double? enabledBorderRadius; //textfield a tıklanadan önce dış çemberin köşe ovallik oranı
  double? focusedBorderRadius;//textfield a tıklanıp focuslandıktan sonra dış çemberin köşe ovallik oranı

  String? hintText;
  String? labelText;
  String? prefixText;
  String? suffixText;

  var controller = TextEditingController();
  IconData? icon;

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
