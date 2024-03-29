import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register1 extends StatefulWidget {

  @override
  _Register1State createState() => _Register1State();

  //Tittle variables
  String? tittleText;
  Color? tittleTextColor;

  // Textfield variables
  String? hintTextUserName;
  String? hintTextEmail;
  String? hintTextPassword;
  String? hintTextPasswordAgain;
  Color? textFieldTextColor;
  Color? textFieldHintTextColor;

  // Button variables
  String? registerButtonText;
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
  //Pages background color
  Color? pageBackGroundColor1;
  Color? pageBackGroundColor2;

  //appBar
  Widget? appBarBackButtonIcon;
  //Fonksyonlar
  var appBarBackButtonOnTab;
  var registerButonOnTab;
  var loginButtonOnTab;
  var createAnewAccountButtonOnTab;

  //CONTROLLER
  var userNameController = TextEditingController();
  var eMailController = TextEditingController();
  var userPassController = TextEditingController();
  var userPassAgainController = TextEditingController();


  Register1(
      {this.tittleText,
        this.hintTextUserName,
        this.hintTextPassword,
        this.hintTextEmail,
        this.hintTextPasswordAgain,
        this.registerButtonText,
        this.newAccountButtonText,
        this.tittleTextColor,
        this.textFieldTextColor,
        this.textFieldHintTextColor,
        this.iconColor,
        this.buttonsTextColor,
        this.buttonsColor,
        this.backGroundContainerColor,
        this.pageBackGroundColor1,
        this.pageBackGroundColor2,
        this.newAccountTextColor,
        this.userIcon,
        this.passIcon,
        this.appBarBackButtonIcon,
        this.appBarBackButtonOnTab,
        this.createAnewAccountButtonOnTab,
        this.loginButtonOnTab,
        this.registerButonOnTab,
        required this.userNameController,
        required this.userPassController,
        required this.eMailController,
        required this.userPassAgainController
      });
}

class _Register1State extends State<Register1>
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
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:widget.appBarBackButtonIcon ??  const Icon(Icons.arrow_back_ios),
        ), systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ScrollConfiguration(
        behavior: MyBehaviorReg1(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.pageBackGroundColor1 ?? const Color(0xffFEC37B),
                    widget.pageBackGroundColor2 ?? const Color(0xffFF4184),
                  ],
                ),
              ),
              child: Opacity(
                opacity: _opacity.value,
                child: Transform.scale(
                  scale: _transform.value,
                  child: Container(
                    width: size.width * .9,
                    height: size.width * 1.1,
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
                            'Sign In',
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
                        component1(icon: widget.userIcon ?? Icons.account_circle_outlined,
                            hintText:  widget.hintTextEmail ?? 'e-mail...',
                            isPassword:  false,isEmail:  true,controller: widget.userNameController),
                        component1(
                            icon: widget.passIcon ??  Icons.lock_outline,
                            hintText: widget.hintTextPassword ?? 'Password...',
                            isPassword:  true,isEmail:  false,controller: widget.userPassController),
                        component1(
                            icon: widget.passIcon ??  Icons.lock_outline,
                            hintText: widget.hintTextPasswordAgain ?? 'Password again...',
                            isPassword:  true,isEmail:  false,controller: widget.userPassController),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            component2(
                              widget.registerButtonText ??   'Sign in',
                              2.6,
                                  () {
                                HapticFeedback.lightImpact();

                                widget.registerButonOnTab();


                              },
                            ),
                            SizedBox(width: size.width / 25),
                           

                          ],
                        ),
                        const SizedBox(),
                        Container(
                          width: size.width / 2.6,
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text:widget.newAccountButtonText ?? 'Already have an account?',
                              style: TextStyle(
                                color:widget.newAccountTextColor ?? Colors.blueAccent,
                                fontSize: 15,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  widget.loginButtonOnTab();
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
      height: size.width / 8,
      width: size.width / 1.22,
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

  Widget component2(
      String string, double width, VoidCallback voidCallback, ) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Container(
        height: size.width / 8,
        width: size.width / width,
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

class MyBehaviorReg1 extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }
}


