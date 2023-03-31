import 'package:flutter/material.dart';
import 'package:pairs/Screens/SignInScreen/SignIn_Screen.dart';
import 'Screens/TourScreen/Tour_Screen.dart';


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
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFDDDCDD),
        fontFamily: "JosefinSans",
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            size: 30,
            color: Colors.black,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
          )
        )
      ),
      routes: {
        Tour_Screen.id: (context) => Tour_Screen(),
        SignInScreen.id: (context) => SignInScreen(),
      },
    );
  }
}

