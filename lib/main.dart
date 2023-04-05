import 'package:flutter/material.dart';
import 'package:pairs/Screens/OTPScreen/OTP_Screen.dart';
import 'package:pairs/Screens/RegistrationScreen/Registration_Screen.dart';
import 'package:pairs/Screens/SignInScreen/SignIn_Screen.dart';
import 'package:pairs/Screens/SignUpScreen/SignUp_Screen.dart';
import 'Screens/TourScreen/Tour_Screen.dart';
import 'package:pairs/Constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Pairs());
}

class Pairs extends StatelessWidget {
  const Pairs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tour_Screen(),
      theme: buildThemeData(),
      routes: {
        Tour_Screen.id: (context) => Tour_Screen(),
        SignInScreen.id: (context) => SignInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        OTP_Screen.id: (context) => OTP_Screen(),
      },
    );
  }
}
