import 'package:flutter/material.dart';
import 'Screens/TourScreen/Tour_Screen.dart';

void main() {
  runApp(const Pairs());
}

class Pairs extends StatelessWidget {
  const Pairs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tour_Screen(),
      routes: {
        Tour_Screen.id: (context) => Tour_Screen(),
      },
    );
  }
}

