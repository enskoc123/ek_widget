import 'package:flutter/material.dart';

class GravityButton extends StatefulWidget {
  @override
  _GravityButtonState createState() => _GravityButtonState();

  Color? iconUpColor;
  Color? iconDownColor;
  Color? upColor;
  Color? downColor;
  var onPressed;

  GravityButton(
      {this.iconUpColor,
      this.iconDownColor,
      this.upColor,
      this.downColor,
      this.onPressed});
}

class _GravityButtonState extends State<GravityButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(bottom: isTapped ? 0 : 400),
        duration: Duration(seconds: 1),
        curve: isTapped ? Curves.bounceOut : Curves.ease,
        height: 150,
        width: 220,
        decoration: BoxDecoration(
          color: isTapped
              ? widget.downColor ?? Color(0xffFF4E4E)
              : widget.upColor ?? Color(0xffFF4E4E),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 10,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            isTapped ? Icons.arrow_downward : Icons.arrow_upward,
            color: isTapped
                ? widget.iconDownColor ?? Colors.white
                : widget.iconUpColor ?? Colors.blueGrey,
            size: 35,
          ),
        ),
      ),
    );
  }
}
