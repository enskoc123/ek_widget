import 'package:flutter/material.dart';
/// Yerrçekimi efekti ile butonun yukarı ve aşağı yonlü hareket etmesi sağlanır.
///butona ekstradan on pressed metodu eklenebilir
/// icon renkleri düzenlenebilir
///aşağı ve yukarı yönlü renkleri düzelenebilir
class GravityButton extends StatefulWidget {
  @override
  _GravityButtonState createState() => _GravityButtonState();
/// butonun üst konumdayken sahip olguğu icon rengi
  Color? iconUpColor;
  /// buttonun alt konumdayken sahip olduğu icon rengi
  Color? iconDownColor;
 /// butonun üst konumda sahip olduğu button rengi
  Color? upColor;
  ///buttonun alt konumda sahip olduğu button rengi
  Color? downColor;
  /// button a ait on pressed methodu
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
        duration: const Duration(seconds: 1),
        curve: isTapped ? Curves.bounceOut : Curves.ease,
        height: 150,
        width: 220,
        decoration: BoxDecoration(
          color: isTapped
              ? widget.downColor ?? const Color(0xffFF4E4E)
              : widget.upColor ?? const Color(0xffFF4E4E),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 10,
              offset: const Offset(0, 7),
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
