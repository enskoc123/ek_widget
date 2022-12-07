import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPage1State createState() => _LoginPage1State();

  //Tittle variables
  String? tittleText;
  Color? tittleTextColor;

  // Textfield variables
  String? hintTextUserName;
  String? hintTextPassword;
  Color? textFieldTextColor;
  Color? textFieldHintTextColor;

  // Button variables
  String? loginButtonText;
  String? forgettenPassButtonText;
  Color? buttonsTextColor;
  Color? buttonsColor;

  String? newAccountButtonText;


  // Icons
  Color? iconColor;
  IconData? userIcon;
  IconData? passIcon;

  //background
  Color? backGroundColor;
  String? backGroundImageLink;


  //Fonksyonlar
  var loginButonOnTab;
  var forgetPassButtonOnTab;
  var createAnewAccountButtonOnTab;

  //Animation color
  Color? circleColor1;
  Color? circleColor2;
  String? logoImageLink;

  //Controller

  TextEditingController userNameController;
  TextEditingController userPassController;


  LoginPage1(
      {this.tittleText,
      this.hintTextUserName,
      this.hintTextPassword,
      this.loginButtonText,
      this.forgettenPassButtonText,
      this.newAccountButtonText,
      this.buttonsTextColor,
      this.tittleTextColor,
      this.textFieldTextColor,
      this.textFieldHintTextColor,
      this.buttonsColor,
      this.iconColor,
      this.backGroundColor,
      this.circleColor1,
      this.circleColor2,
      this.loginButonOnTab,
      this.createAnewAccountButtonOnTab,
      this.forgetPassButtonOnTab,
      this.userIcon,
      this.passIcon,
      this.logoImageLink
      ,this.backGroundImageLink,
      required this.userPassController,
        required this.userNameController
      });
}

class _LoginPage1State extends State<LoginPage1> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.backGroundColor ?? Color(0xff192028),
      body: ScrollConfiguration(
        behavior: MyBehaviorL(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                if (widget.backGroundImageLink != null)
                  Image.network(
                    widget.backGroundImageLink ??
                        "http://mzkarakas.com/wp-content/uploads/2020/06/flutterlogo.jpg",
                    height: size.height,
                    width: size.width ,
                    fit: BoxFit.fitHeight,
                  ),
                Positioned(
                  top: size.height * (animation2.value + .58),
                  left: size.width * .21,
                  child: CustomPaint(
                    painter: MyPainter(
                        radius: 50,
                        color1: widget.circleColor1,
                        color2: widget.circleColor2),
                  ),
                ),
                Positioned(
                  top: size.height * .98,
                  left: size.width * .1,
                  child: CustomPaint(
                    painter: MyPainter(
                        radius: animation4.value - 30,
                        color1: widget.circleColor1,
                        color2: widget.circleColor2),
                  ),
                ),
                Positioned(
                  top: size.height * .5,
                  left: size.width * (animation2.value + .8),
                  child: CustomPaint(
                    painter: MyPainter(
                        radius: 30,
                        color1: widget.circleColor1,
                        color2: widget.circleColor2),
                  ),
                ),
                Positioned(
                  top: size.height * animation3.value,
                  left: size.width * (animation1.value + .1),
                  child: CustomPaint(
                    painter: MyPainter(
                        radius: 60,
                        color1: widget.circleColor1,
                        color2: widget.circleColor2),
                  ),
                ),
                Positioned(
                  top: size.height * .1,
                  left: size.width * .8,
                  child: CustomPaint(
                    painter: MyPainter(
                        radius: animation4.value,
                        color1: widget.circleColor1,
                        color2: widget.circleColor2),
                  ),
                ),
                if (widget.logoImageLink != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 110, left: 150, right: 150),
                    child: Image.network(
                      widget.logoImageLink ??
                          "http://mzkarakas.com/wp-content/uploads/2020/06/flutterlogo.jpg",
                      height: size.width / 3,
                      width: size.width / 3,
                    ),
                  ),
                Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * .1),
                        child: Text(
                          widget.tittleText ?? 'APP NAME',
                          style: TextStyle(
                            color: widget.tittleTextColor ??
                                Colors.white.withOpacity(.7),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 4,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          component1(
                             icon:  widget.userIcon ?? Icons.account_circle_outlined,
                             hintText:  widget.hintTextUserName ?? 'User name...',
                             isEmail:  false,
                            isPassword:   false,
                          controller: widget.userNameController),
                          component1(
                              icon: widget.passIcon ?? Icons.lock_outline,
                              hintText: widget.hintTextPassword ?? 'Password...',
                              isPassword: true,
                              isEmail: false,
                          controller: widget.userPassController
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              component2(
                                widget.loginButtonText ?? 'LOGIN',
                                2.58,
                                () {
                                  widget.loginButonOnTab();
                                  HapticFeedback.lightImpact();
                                },
                              ),
                              SizedBox(width: size.width / 20),
                              component2(
                                widget.forgettenPassButtonText ??
                                    'Forgotten password!',
                                2.58,
                                () {
                                  widget.forgetPassButtonOnTab();
                                  HapticFeedback.lightImpact();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          component2(
                            widget.newAccountButtonText ??
                                'Create a new Account',
                            2,
                            () {
                              widget.createAnewAccountButtonOnTab();
                              HapticFeedback.lightImpact();
                            },
                          ),
                          SizedBox(height: size.height * .05),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component1(
      {
       required IconData icon,
     required String hintText,
     required bool isPassword,
     required bool isEmail,
     required controller}) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 8,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            style: TextStyle(
                color:
                    widget.textFieldTextColor ?? Colors.white.withOpacity(.8)),
            cursorColor: Colors.white,
            obscureText: isPassword,
            controller: controller,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: widget.iconColor ?? Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: widget.textFieldHintTextColor ?? Colors.white.withOpacity(.5)),
            ),
          ),
        ),
      ),
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.buttonsColor ?? Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: TextStyle(
                  color:
                      widget.buttonsTextColor ?? Colors.white.withOpacity(.8)),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;
  Color? color1;
  Color? color2;

  MyPainter({required this.radius, this.color1, this.color2});

  //[Color(0xffFD5E3D), Color(0xffC43990)]
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(colors: [
        color1 ?? Color(0xffFD5E3D),
        color2 ?? Color(0xffC43990)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehaviorL extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
