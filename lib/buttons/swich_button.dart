import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnOffButton extends StatefulWidget {
  @override
  _OnOffButtonState createState() => _OnOffButtonState();

  String? textForOn;
  String? textForOff;
  Color? colorForOn;
  Color? colorForOff;
  Color? textColorForOn;
  Color? textColorForOff;

  OnOffButton(
      {this.textForOn, this.textForOff, this.colorForOn, this.colorForOff,this.textColorForOff,this.textColorForOn});
}

class _OnOffButtonState extends State<OnOffButton>
    with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(
              () {
            isTapped = !isTapped;
            HapticFeedback.lightImpact();
          },
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 64 : 67,
        width: isTapped ? 190 : 200,
        decoration: BoxDecoration(
          color: isTapped ?widget.colorForOff ?? Color(0xffB23F3F) :widget.colorForOn ?? Color(0xffFF4E4E),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isTapped ? 0 : 0.3),
              blurRadius: isTapped ? 0 : 10,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Center(
          child: Text(
            isTapped ? widget.textForOff ?? 'OFF' :widget.textForOn ?? 'ON',
            style: TextStyle(
              color: isTapped
                  ?widget.textColorForOff ?? Colors.white.withOpacity(0.5)
                  :widget.textColorForOn ?? Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }
}
