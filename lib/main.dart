import 'package:flutter/material.dart';
import 'package:pairs/Screens/SignInScreen/SignIn_Screen.dart';
import 'package:pairs/Screens/SignUpScreen/SignUp_Screen.dart';
import 'Screens/TourScreen/Tour_Screen.dart';
import 'package:pairs/Constants.dart';

void main() {
  runApp(const Pairs());
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
      },
    );
  }
}
