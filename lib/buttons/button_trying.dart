import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonTrying extends StatefulWidget {
  @override
  _ButtonTryingState createState() => _ButtonTryingState();

  Color? color;
  Color? textColor;
  Color? shadowColor;
  String? buttonText;
  var onPressed;

  ButtonTrying({this.color, this.buttonText,this.onPressed,this.textColor,this.shadowColor});
}

class _ButtonTryingState extends State<ButtonTrying>
    with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      onTap: () {
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 55 : 60,
        width: isTapped ? 150 : 160,
        decoration: BoxDecoration(
          color: widget.color ?? Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor ?? Colors.black.withOpacity(0.3),
              blurRadius: 30,
              offset: Offset(3, 7),
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.buttonText ??'Button try',
            style: TextStyle(
              color:widget.textColor ?? Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }
}
