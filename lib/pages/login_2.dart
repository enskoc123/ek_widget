import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();

  //Tittle variables
  ///başlık yazısı
  String? tittleText;

  ///başlık yazısınınrengi
  Color? tittleTextColor;

  // Textfield variables
  ///kullanıcıadının hinttexti
  String? hintTextUserName;

  ///şifrenin hinttext i
  String? hintTextPassword;

  /// textfield içerisine yazılan yazıların rengi
  Color? textFieldTextColor;

  ///hinttextlerin rengi
  Color? textFieldHintTextColor;

  // Button variables
  /// giriş yap butonunun üzerindeki yazı
  String? loginButtonText;

  /// şifremi unuttum butonu üzerine yazılacak text
  String? forgettenPassButtonText;

  ///yeni kullanıcı oluştur butonu üzerindeki text
  String? newAccountButtonText;

  ///butonların üzerinteki textlerin rengi
  Color? buttonsTextColor;
  ///butonların rengi
  Color? buttonsColor;

  // Icons
  Color? iconColor;
  IconData? userIcon;
  IconData? passIcon;

  //Background
  Color? backGroundColor;
  String? backGroundImageLink;

  //on pressed
  var loginButonOnTab;
  var forgetPassButtonOnTab;
  var createAnewAccountButtonOnTab;

  //Controller

  TextEditingController userNameController;
  TextEditingController userPassController;

  String? logoImageLink;

  LoginPage2(
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
      this.loginButonOnTab,
      this.createAnewAccountButtonOnTab,
      this.forgetPassButtonOnTab,
      this.userIcon,
      this.passIcon,
      this.logoImageLink,
      this.backGroundImageLink,
      required this.userPassController,
      required this.userNameController});
}

class _LoginPage2State extends State<LoginPage2> with TickerProviderStateMixin {
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
      duration: const Duration(
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
      duration: const Duration(
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

    Timer(const Duration(milliseconds: 2500), () {
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
      backgroundColor: widget.backGroundColor ?? const Color(0xff192028),
      body: ScrollConfiguration(
        behavior: MyBehaviorLgClean(),
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
                    width: size.width,
                    fit: BoxFit.fitHeight,
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
                              icon: widget.userIcon ??
                                  Icons.account_circle_outlined,
                              hintText:
                                  widget.hintTextUserName ?? 'User name...',
                              isEmail: false,
                              isPassword: false,
                              controller: widget.userNameController),
                          component1(
                              icon: widget.passIcon ?? Icons.lock_outline,
                              hintText:
                                  widget.hintTextPassword ?? 'Password...',
                              isPassword: true,
                              isEmail: false,
                              controller: widget.userPassController),
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
      {required IconData icon,
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
                  color: widget.textFieldHintTextColor ??
                      Colors.white.withOpacity(.5)),
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
        color1 ?? const Color(0xffFD5E3D),
        color2 ?? const Color(0xffC43990)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
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
