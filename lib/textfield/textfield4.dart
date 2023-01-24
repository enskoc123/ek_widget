import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberTextField extends StatelessWidget {
  Color? boxColor;
  Color? textColor;
  Color? hintTextColor;
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

  var controller = TextEditingController();
  IconData? icon;
  int? maxLength;


  PhoneNumberTextField(
      {this.boxColor,
      this.textColor,
      this.hintTextColor,
      this.labelTextColor,
      this.iconColor,
      this.prefixTextColor,
      this.focusedBorderColor,
      this.enabledBorderColor,
      this.focusedBorderRadius,
      this.enabledBorderRadius,
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
          focusColor: Colors.orange,
          hoverColor: Colors.black,


          filled: true,
          icon: Icon(icon ?? Icons.phone,color:iconColor ?? Colors.black),
          hintText:hintText ?? "Telefon Numarası",
          labelText:labelText ??"tel no",
          prefixText: prefixText ??'+90 ',
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
        keyboardType: TextInputType.phone,
        onSaved: (value) {

        },
        maxLength:maxLength ?? 11,
        maxLengthEnforcement: MaxLengthEnforcement.none,

        // TextInputFormatters are applied in sequence.

      ),
    );
  }
}
