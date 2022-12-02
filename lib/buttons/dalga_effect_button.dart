
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DalgaliButton extends StatefulWidget {
  @override
  _DalgaliButtonState createState() => _DalgaliButtonState();

  Widget? icon;
  int? iconSize;
  Color? iconColor;
  Color? backgroundColor;

  DalgaliButton({this.icon,this.iconColor,this.iconSize,this.backgroundColor});
}

class _DalgaliButtonState extends State<DalgaliButton>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
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
              shape: CircleBorder(),
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
            shape: CircleBorder(),
          ),
          child: IconButton(
            onPressed: () {
              print('button tapped');
            },
            color:widget.iconColor ?? Colors.blue,
            icon:widget.icon ?? Icon(
              Icons.calendar_today,
              size: 24 ,
            ),
          ),
        ),
      ),
    );
    }
}