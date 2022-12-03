import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPageBackCln extends StatefulWidget {
  @override
  _LoginPageBackClnState createState() => _LoginPageBackClnState();

  //Tüm txt değişlenler
  String? appName;
  String? userNAme;
  String? eMail;
  String? passWord;
  String? loginButtonText;
  String? forgetPassButText;
  String? creataNewAccountText;


  //uygulama adının rengi
  Color? appNameTextColor;

  //textfield ların  tex ve hintext rengi
  Color? hinttextColor;
  Color? textFieldTextColor;

  //butonların ortan katman rengi
  Color? boxButtonColor;
  Color? buttonTextColor;

  // iconların ortak rengi
  Color? iconColor;

  //arkaplan rengi
  Color? backGroundColor;

  //Animasyon renkleri
  Color? circleColor1;
  Color? circleColor2;

  IconData? userIcon;
  IconData? mailIcon;
  IconData? passIcon;

  //on pressed
  var girisYapbuttonFonksyon;
  var sifreUnuttumFonksyon;
  var yeniKullaniciButonFonksyon;

  String? networkImageLink;
  String? backGroundImage;

  LoginPageBackCln(
      {this.appName,
        this.userNAme,
        this.eMail,
        this.passWord,
        this.loginButtonText,
        this.forgetPassButText,
        this.creataNewAccountText,
        this.buttonTextColor,
        this.appNameTextColor,
        this.textFieldTextColor,
        this.hinttextColor,
        this.boxButtonColor,
        this.iconColor,
        this.backGroundColor,
        this.circleColor1,
        this.circleColor2,
        this.girisYapbuttonFonksyon,
        this.yeniKullaniciButonFonksyon,
        this.sifreUnuttumFonksyon,
        this.userIcon,
        this.mailIcon,
        this.passIcon,
        this.networkImageLink,
        this.backGroundImage
      });
}

class _LoginPageBackClnState extends State<LoginPageBackCln> with TickerProviderStateMixin {
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
        behavior: MyBehaviorLgClean(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                if (widget.backGroundImage != null)
                  Image.network(
                    widget.backGroundImage ??
                        "http://mzkarakas.com/wp-content/uploads/2020/06/flutterlogo.jpg",
                    height: size.height,
                    width: size.width ,
                    fit: BoxFit.fitHeight,
                  ),
                if (widget.networkImageLink != null)
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 110, left: 150, right: 150),
                    child: Image.network(
                      widget.networkImageLink ??
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
                          widget.appName ?? 'APP NAME',
                          style: TextStyle(
                            color: widget.appNameTextColor ??
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
                              widget.userIcon ?? Icons.account_circle_outlined,
                              widget.userNAme ?? 'User name...',
                              false,
                              false),
                          component1(widget.mailIcon ?? Icons.email_outlined,
                              widget.eMail ?? 'Email...', false, true),
                          component1(widget.passIcon ?? Icons.lock_outline,
                              widget.passWord ?? 'Password...', true, false),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              component2(
                                widget.loginButtonText ?? 'LOGIN',
                                2.58,
                                    () {
                                  widget.girisYapbuttonFonksyon();
                                  HapticFeedback.lightImpact();
                                },
                              ),
                              SizedBox(width: size.width / 20),
                              component2(
                                widget.forgetPassButText ??
                                    'Forgotten password!',
                                2.58,
                                    () {
                                  widget.sifreUnuttumFonksyon();
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
                            widget.creataNewAccountText ??
                                'Create a new Account',
                            2,
                                () {
                              widget.yeniKullaniciButonFonksyon();
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
      IconData icon, String hintText, bool isPassword, bool isEmail) {
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
                  color: widget.hinttextColor ?? Colors.white.withOpacity(.5)),
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
              color: widget.boxButtonColor ?? Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: TextStyle(
                  color:
                  widget.buttonTextColor ?? Colors.white.withOpacity(.8)),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainterCln extends CustomPainter {
  final double radius;
  Color? color1;
  Color? color2;

  MyPainterCln({required this.radius, this.color1, this.color2});

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

class MyBehaviorLgClean extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}