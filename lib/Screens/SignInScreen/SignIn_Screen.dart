import 'package:flutter/material.dart';
import 'SignIn_Body.dart';

class SignInScreen extends StatelessWidget {
  static const String id = "SignInScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
