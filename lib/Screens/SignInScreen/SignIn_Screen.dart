import 'package:flutter/material.dart';
import 'SignIn_Body.dart';
import 'package:pairs/Constants.dart';

class SignInScreen extends StatelessWidget {
  static const String id = "SignInScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
