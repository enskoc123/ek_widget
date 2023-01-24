import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigTittleTextAnton extends StatelessWidget {
  String? text;

  Color? color;
  /// Gölge rengi verirsen gölgel olur
  Color? shadowColor;
  /// Text e arkaplan rengi verir. Buton işlevi görmez
  Color? backGroundColor;
  ///Text in boyutunu belirler
  double? fontSize;
  /// Harfler arasında istediğin aralık miktarını girerek ayırabilirsin
  double? letterSpace;
  /// Kelimeler arasına istediğin boşluğu verebilirsin
  double? wordSpace;
  ///font kalınlığını ifade eder
  FontWeight? fontWeight;

  GoogleFonts? googleFonts;

  BigTittleTextAnton({this.text, this.color, this.fontSize,this.shadowColor,this.backGroundColor, this.fontWeight,this.letterSpace,this.wordSpace,this.googleFonts});


  @override
  Widget build(BuildContext context) {
    return Text(text ??
      "",style: GoogleFonts.anton(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 150,
      shadows: [
        Shadow(
            color:shadowColor ?? Colors.transparent,
            offset:  const Offset(5.0, 5.0),
            blurRadius: 10
        ),
      ],
      backgroundColor: backGroundColor,
      fontWeight: fontWeight ,
      letterSpacing: letterSpace,
      wordSpacing: wordSpace,


    ),
    );
  }
}
