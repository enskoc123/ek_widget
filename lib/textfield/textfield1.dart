import 'package:flutter/material.dart';
/// email yada şifre maksadıyla kullanılabilir.
/// boxColor ile textfield zemin rengi değiştirilebilir
/// prefix ve suffix olarak icon ve text oluşturulabilir.
/// İmage
/// <br/>
/// <img src="https://raw.githubusercontent.com/enskoc123/Package-documation/main/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202023-01-04%20185337.png" width="350"/>
class Textfield1 extends StatelessWidget {
  bool? isPassword;
  bool? isEmail;

  /// textfieldin arkaplan rengi
  Color? boxColor;

  /// yazılmakta olan textin rengi
  Color? textColor;

  /// hinttext in rengi
  Color? hintTextColor;

  /// label text rengi
  Color? labelTextColor;

  Color? prefixIconColor;
  Color? suffixIconColor;

  Color? focusedBorderColor;

  ///Textfield ın dış çemberinin rengi
  Color? enabledBorderColor;

  ///textfield a tıklanadan önce dış çemberin köşe ovallik oranı
  double? enabledBorderRadius;

  String? hintText;
  String? labelText;

  /// ön text , textfieldın sol kenarında bulunan açıklama texti
  String? prefixText;
  Color? prefixTextColor;

  /// son text , textfieldın sağ kenarında bulunan açıklama texti
  String? suffixText;
  Color? suffixTextColor;

  var controller = TextEditingController();

  ///textfieldin sağ tarafında bulunan icon
  IconData? prefixIcon;

  ///textfieldin sol tarafında bulunan icon
  IconData? suffixIcon;

  /// maxsimum yazılabilir karakter sayısınını belirtebilirsiniz
  int? maxLength;

  /// textfield in yazıya başlama noktasını belirlemek maksadıyla TextAlign.center vb.
  TextAlign? textAlign;

  Textfield1(
      {this.boxColor,
      this.textColor,
      this.hintTextColor,
      this.suffixIconColor,
      this.hintText,
      required this.isPassword,
      required this.isEmail,
      required this.controller,
      this.prefixIcon,
      this.prefixIconColor,
      this.suffixTextColor,
      this.suffixText,
      this.prefixTextColor,
      this.prefixText,
      this.maxLength,
      this.enabledBorderRadius,
      this.enabledBorderColor,
      this.labelText,
      this.suffixIcon,
      this.labelTextColor,
      this.focusedBorderColor,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: textColor ?? Colors.black.withOpacity(.8)),
        obscureText: isPassword!,
        keyboardType:
            isEmail! ? TextInputType.emailAddress : TextInputType.text,
        textAlign: textAlign ?? TextAlign.start,
        decoration: InputDecoration(
          fillColor: boxColor ?? Colors.white,
          filled: true,
          prefixIcon: Icon(
            prefixIcon,
            color: prefixIconColor ?? Colors.black.withOpacity(.7),
          ),
          suffixIcon: Icon(suffixIcon),
          prefixText: prefixText,
          prefixStyle: TextStyle(
            color: prefixTextColor ?? Colors.black,
          ),
          suffixText: suffixText,
          suffixStyle: TextStyle(color: suffixTextColor ?? Colors.black),
          labelText: labelText,
          labelStyle: TextStyle(color: labelTextColor),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 3, color: focusedBorderColor ?? Colors.black),
            borderRadius: BorderRadius.circular(enabledBorderRadius ?? 25.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(enabledBorderRadius ?? 30.0),
            borderSide: BorderSide(
                width: 3,
                color: enabledBorderColor ?? Colors.black), //<-- SEE HERE
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
