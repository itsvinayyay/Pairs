import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String lbl, String hint) {
  return InputDecoration(
    label: Text(lbl),
    labelStyle: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.w900,
      fontSize: 20,
      fontFamily: "JosefinSans-italic",
    ),
    hintText: hint,
    hintStyle: TextStyle(
        fontFamily: "JosefinSans-italic", fontWeight: FontWeight.w900),
  );
}

TextStyle build_AppBar_style() {
  return TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.w900,
    fontSize: 25,
  );
}

ThemeData buildThemeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: build_OutlineInputBorder(),
      focusedBorder: build_OutlineInputBorder(),
    ),
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
      ),
    ),
  );
}

OutlineInputBorder build_OutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
      gapPadding: 0,
    );
}

BoxDecoration build_background() {
  return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/back.png"),
        fit: BoxFit.cover,
        opacity: 0.4,
      )
  );
}

