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
    fontFamily: "JosefinSans",
  );
}

ThemeData buildThemeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: build_OutlineInputBorder(),
      focusedBorder: build_OutlineInputBorder(),
    ),
    scaffoldBackgroundColor: Color(0xFFD9D8DA),
    fontFamily: "JosefinSans",
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        size: 30,
        color: Colors.black,
      ),
      titleTextStyle: build_AppBar_style(),
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

TextStyle build_Headings(){
  return TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.w700,
    fontSize: 50
    ,
    fontFamily: "JosefinSans-Regular",
  );
}

const String kemailnullerror = "Please Enter the email";
const String kvalidemailerror = "Please enter valid email";
const String knullpasserror = "Please enter the password";
const String kshortpass = "Entered password is too short";
const String knopassmatch = "Password didn't match!";
const String kconfpassnull = "Please Confirm the password";
const String kfirstnamenull = "Please Enter your First name";
const String kLastnamenull = "Please Enter your Last name";
const String knumbernull = "Please Enter your phone number";
const String kaddressnull = "Please Enter your address";
const String knumnotvalid = "The Entered number is not valid";
const String kinvalidaddress = "Address must contains atleast 8 characters";

