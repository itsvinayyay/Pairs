import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';

import 'TourScreen_Body.dart';

class Tour_Screen extends StatelessWidget {
  const Tour_Screen({Key? key}) : super(key: key);

  static const String id = "TourScreen";

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().access(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Body(),
      ),
    );
  }
}
