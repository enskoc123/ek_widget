
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DalgaliAvatarGlow extends StatefulWidget {
  @override
  _DalgaliAvatarGlowState createState() => _DalgaliAvatarGlowState();

  Color? circleBoxColor;
  Color? circleWaveColor;
  Color? iconColor;
  Widget? icon;
  var onPressed;

  DalgaliAvatarGlow(
      {this.circleBoxColor, this.circleWaveColor, this.iconColor,this.icon,this.onPressed});
}

class _DalgaliAvatarGlowState extends State<DalgaliAvatarGlow> {
  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowColor:widget.circleWaveColor ?? Colors.white,
      endRadius: 120,
      duration: Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      curve: Curves.easeOutQuad,
      child: GestureDetector(
        onTap: (){
          widget.onPressed();
        },
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color:widget.circleBoxColor ?? Colors.white, borderRadius: BorderRadius.circular(99)),
          child:widget.icon ?? Icon(
            Icons.favorite,
            color:widget.iconColor ?? Colors.blue,
            size: 40,
          ),
        ),
      ),
    );
  }
}