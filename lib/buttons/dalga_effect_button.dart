
import 'package:flutter/material.dart';
///dalgalı bir efekt ile animasyona sahip bir buton
class DalgaliButton extends StatefulWidget {
  @override
  _DalgaliButtonState createState() => _DalgaliButtonState();
 /// button üzerindeki icon
  Widget? icon;
  /// icon un ebatı
  int? iconSize;
  ///iconun rengi
  Color? iconColor;
 ///butonun arkaplan rengi
  Color? backgroundColor;
  /// sahip olduğu metod
  var onPressed;

  DalgaliButton({this.icon,this.iconColor,this.iconSize,this.backgroundColor,this.onPressed});
}

class _DalgaliButtonState extends State<DalgaliButton>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Container(
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: const CircleBorder(),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                8.0 * animationController.value,
              ),
              child: child,
            ),
          );
        },
        child: Container(
          decoration: ShapeDecoration(
            color:widget.backgroundColor ?? Colors.white,
            shape: const CircleBorder(),
          ),
          child: IconButton(
            onPressed: () {
              widget.onPressed();
            },
            color:widget.iconColor ?? Colors.blue,
            icon:widget.icon ?? const Icon(
              Icons.calendar_today,
              size: 24 ,
            ),
          ),
        ),
      ),
    );
    }
}