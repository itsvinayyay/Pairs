import 'package:flutter/material.dart';

class SizeConfiguration {
  static late MediaQueryData _mediaQuery;
  static late double screenheight;
  static late double screenwidth;
  static late Orientation orientation;

  void access(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    screenheight = _mediaQuery.size.height;
    screenwidth = _mediaQuery.size.width;
    orientation = _mediaQuery.orientation;
  }
}


double getproportionatescreenheight(double height) {
  double Screenheight = SizeConfiguration.screenheight;
  return (height / 812.0) * Screenheight;
}

double getproportionatescreenwidth(double width) {
  double Screenwidth = SizeConfiguration.screenwidth;
  return (width / 812.0) * Screenwidth;
}
