

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FrogPassPage3 extends StatefulWidget {

  @override
  _FrogPassPage3State createState() => _FrogPassPage3State();

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
  String? newAccountButtonText;

  Color? buttonsTextColor;
  Color? buttonsColor;
  Color? newAccountTextColor;

  //Icons
  Color? iconColor;
  IconData? userIcon;
  IconData? passIcon;

  // Container on BackGround
  Color? backGroundContainerColor;
  //Arkaplanda görünen renleri listeye atıp geçiş rengi vermek için kullan deger gelmezse varsayılan renkler verilir
  List<Color>? pageBackGroundColorList;

  //appBar
  Widget? appBarBackButtonIcon;

  //Fonksyonlar
  var appBarBackButtonOnTab;

  var loginButonOnTab;
  dynamic forgetPassButtonOnTab;
  var createAnewAccountButtonOnTab;

  //CONTROLLER
  TextEditingController userNameController;

  /// App Bar açık kapalı varsayılanı kapalı
  bool isAppBar = false;

  /// Yeni hesap butonu açık kapalı varsayılanı kapalı
  bool isCreateAnewAccountButton = false;

  /// Şifremi unuttum butonu açık kapalı varsayılanı kapalı
  bool isLoginButton = false;


  /// web görünümüne geçevegi genişlik seviyesi varsayılanı 830
  double webSize = 830;

  /// web görünümüne geçevegi genişlik seviyesi2 varsayılanı 830
  double webSize2 = 1400;

  FrogPassPage3(
      {this.tittleText,
        this.hintTextUserName,
        this.hintTextPassword,
        this.loginButtonText,
        this.forgettenPassButtonText,
        this.newAccountButtonText,
        this.tittleTextColor,
        this.textFieldTextColor,
        this.textFieldHintTextColor,
        this.iconColor,
        this.buttonsTextColor,
        this.buttonsColor,
        this.backGroundContainerColor,
        this.pageBackGroundColorList,
        this.newAccountTextColor,
        this.isCreateAnewAccountButton = false,
        this.isLoginButton = false,
        this.isAppBar = false,
        this.webSize = 830,
        this.webSize2 = 1400,
        this.userIcon,
        this.passIcon,
        this.appBarBackButtonIcon,
        this.appBarBackButtonOnTab,
        this.createAnewAccountButtonOnTab,
        this.forgetPassButtonOnTab,
        this.loginButonOnTab,
        required this.userNameController,
      });
}

class _FrogPassPage3State extends State<FrogPassPage3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
      setState(() {});
    });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: widget.isAppBar ? AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:widget.appBarBackButtonIcon ??  const Icon(Icons.arrow_back_ios),
        ), systemOverlayStyle: SystemUiOverlayStyle.light,
      ):null,
      body: ScrollConfiguration(
        behavior: MyBehaviorfd(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:widget.pageBackGroundColorList?? [
                    const Color(0xffFEC37B),
                    const Color(0xffFF4184),
                    const Color(0xffFFffff),
                  ],
                ),
              ),
              child: Opacity(
                opacity: _opacity.value,
                child: Transform.scale(
                  scale: _transform.value,
                  child: Container(
                    width: size.width>widget.webSize?size.width>widget.webSize2?size.width*.3: size.width* .5 :size.width * .9,
                    height: size.height * .5,
                    decoration: BoxDecoration(
                      color:widget.backGroundContainerColor ?? Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 90,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(),
                        Text(widget.tittleText ??
                            'Şifremi unuttum',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:widget.tittleTextColor ?? Colors.black.withOpacity(.7),
                          ),
                        ),
                        const SizedBox(),
                        component1(icon: widget.userIcon ?? Icons.account_circle_outlined,
                            hintText:  widget.hintTextUserName ?? 'User name...',
                            isPassword:  false,isEmail:  false,controller: widget.userNameController),

                        component2(
                          widget.loginButtonText ??   'Send',
                          2.6,
                              () {
                            HapticFeedback.lightImpact();
                            widget.forgetPassButtonOnTab();

                          },
                        ),
                        const SizedBox(),
                        if(widget.isLoginButton)
                          Container(
                            width: size.width / 2.6,
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text:widget.loginButtonText ??   'Login',
                                style: TextStyle(
                                  color:widget.newAccountTextColor ?? Colors.blueAccent,
                                  fontSize: 15,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    widget.loginButonOnTab();
                                  },
                              ),
                            ),
                          ),
                        if(widget.isCreateAnewAccountButton)
                          Container(
                            width: size.width / 2.6,
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text:widget.newAccountButtonText ?? 'Create a new Account',
                                style: TextStyle(
                                  color:widget.newAccountTextColor ?? Colors.blueAccent,
                                  fontSize: 15,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    widget.createAnewAccountButtonOnTab();
                                  },
                              ),
                            ),
                          ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget component1(
      {required IconData icon,required String hintText,required bool isPassword,required bool isEmail,required controller}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width>widget.webSize ? 70: size.width / 8,
      width: size.width>widget.webSize ? size.width>widget.webSize2?size.width*.2:size.width*.4:size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color:widget.textFieldTextColor ?? Colors.black.withOpacity(.8)),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color:widget.iconColor ?? Colors.black.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
          TextStyle(fontSize: 14, color:widget.textFieldHintTextColor ?? Colors.black.withOpacity(.5)),
        ),
      ),
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Container(
        height: size.width>widget.webSize ? 70: size.width / 8,
        width: size.width>widget.webSize ?size.width>widget.webSize2?size.width*.2: size.width*.4:size.width / 1.22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:widget.buttonsColor ?? const Color(0xff4796ff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          string,
          style: TextStyle(color:widget.buttonsTextColor ?? Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class MyBehaviorfd extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }
}