

import 'package:ek_widget/pages/login_3.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage3(
      userNameController: TextEditingController(),
      userPassController: TextEditingController(),
    ),
  ));
}

