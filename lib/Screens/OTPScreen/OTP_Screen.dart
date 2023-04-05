import 'package:flutter/material.dart';
import 'package:pairs/Constants.dart';
import 'OTP_Body.dart';

class OTP_Screen extends StatelessWidget {
  static const String id = "OTP_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("OTP Verification", style: build_AppBar_style(),),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
