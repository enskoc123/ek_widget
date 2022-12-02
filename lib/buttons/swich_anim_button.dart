
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwichAnimButton extends StatefulWidget {
  @override
  _SwichAnimButtonState createState() => _SwichAnimButtonState();

  Color? swichRightColor;
  Color? swichLeftColor;
  Color? circleColor;


  SwichAnimButton({this.swichRightColor, this.swichLeftColor,});
}

class _SwichAnimButtonState extends State<SwichAnimButton>
    with TickerProviderStateMixin {
  bool isChecked = false;
  Duration _duration = Duration(milliseconds: 370);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Center(
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(
                    () {
                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                  isChecked = !isChecked;
                },
              );
            },
            child: Container(
              width: 100,
              height: 50,
              padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
              decoration: BoxDecoration(
                color: isChecked ?widget.swichRightColor?? Colors.green :widget.swichLeftColor?? Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(99),
                ),
                boxShadow: [
                  BoxShadow(
                    color: isChecked
                        ?widget.swichRightColor??  Colors.green.withOpacity(0.6)
                        :widget.swichLeftColor ?? Colors.red.withOpacity(0.6),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: _animation.value,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                              () {
                            if (_animationController.isCompleted) {
                              _animationController.reverse();

                            } else {
                              _animationController.forward();

                            }
                            isChecked = !isChecked;
                          },
                        );

                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:widget.circleColor ?? Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}