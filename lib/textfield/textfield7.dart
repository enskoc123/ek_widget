import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserNameTextField extends StatelessWidget {
  Color? boxColor;
  Color? textColor;
  Color? hintTextColor;
  Color? labelTextColor;
  Color? iconColor;
  Color? prefixTextColor;
  Color? focusedBorderColor;
  Color? enabledBorderColor;
  double? focusedBorderRadius;
  double? enabledBorderRadius;
  String? hintText;
  String? labelText;
  String? prefixText;

  var controller = TextEditingController();
  IconData? icon;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
          icon: Icon(Icons.phone,color:iconColor ?? Colors.black),
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
        maxLength:maxLength ?? 10,
        maxLengthEnforcement: MaxLengthEnforcement.none,

        // TextInputFormatters are applied in sequence.

      ),
    );
  }
}
