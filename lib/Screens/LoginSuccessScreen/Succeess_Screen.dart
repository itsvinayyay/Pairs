import 'package:flutter/material.dart';
import 'package:pairs/Screens/LoginSuccessScreen/Success_Body.dart';



class LoginSuccess extends StatelessWidget {
  static const String id = "LoginSuccess";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login Success"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Body(),
    );
  }
}
