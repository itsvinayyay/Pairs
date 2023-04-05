import 'package:flutter/material.dart';
import 'package:pairs/Constants.dart';
import 'Registration_Body.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = "RegistrationScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Registration", style: build_AppBar_style(),),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
