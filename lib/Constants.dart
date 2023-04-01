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
