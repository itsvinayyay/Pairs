import 'package:flutter/material.dart';

import 'TourScreen_Body.dart';

class Tour_Screen extends StatelessWidget {
  const Tour_Screen({Key? key}) : super(key: key);

  static const String id = "TourScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.more_horiz_rounded,
            size: 40,
          ),
        ),
        body: Body(),
      ),
    );
  }
}
