import 'package:flutter/material.dart';
import 'package:pairs/Constants.dart';
import 'OTP_Body.dart';

class OTP_Screen extends StatelessWidget {
  static const String id = "OTP_Screen";

  @override
  Widget build(BuildContext context) {
    final phoneNumber_arg passed_arguments = ModalRoute.of(context)!.settings.arguments as phoneNumber_arg;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("OTP Verification", style: build_AppBar_style(),),
        centerTitle: true,
      ),
      body: Body(PhoneNumber: passed_arguments.phoneNumber, verify: passed_arguments.verificationID,),
    );
  }
}

class phoneNumber_arg{
  late String phoneNumber;
  late String verificationID;

  phoneNumber_arg({required this.phoneNumber, required this.verificationID});
}
