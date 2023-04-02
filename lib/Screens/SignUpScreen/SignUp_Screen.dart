import 'package:flutter/material.dart';
import 'package:pairs/Constants.dart';
import 'SignUp_Body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const String id = "SignUpScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Sign Up", style: build_AppBar_style(),),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
