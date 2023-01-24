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
  var onPress;

  OnOffButton(
      {this.textForOn, this.textForOff, this.colorForOn, this.colorForOff,this.textColorForOff,this.textColorForOn,this.onPress});
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
            widget.onPress();
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 64 : 67,
        width: isTapped ? 190 : 200,
        decoration: BoxDecoration(
          color: isTapped ?widget.colorForOff ?? const Color(0xffB23F3F) :widget.colorForOn ?? const Color(0xffFF4E4E),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isTapped ? 0 : 0.3),
              blurRadius: isTapped ? 0 : 10,
              offset: const Offset(0, 7),
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
