import 'package:flutter/material.dart';
import 'package:pairs/Screens/CartScreen/Cart_Screen.dart';
import 'package:pairs/Bottom_Navigations.dart';
import 'HomeScreen_Body.dart';

class Home_Screen extends StatefulWidget {
  static const String id = "Home_Screen";

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
