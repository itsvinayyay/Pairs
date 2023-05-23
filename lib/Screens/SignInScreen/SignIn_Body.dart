import 'package:flutter/material.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Screen_Config.dart';
import 'SignInScreen_Form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back.png"),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getproportionatescreenwidth(60),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getproportionatescreenheight(50),
            ),
            Text(
              "Welcome!",
              style: build_Headings(),
            ),
            SizedBox(
              height: getproportionatescreenheight(30),
            ),
            SignInScreen_Form(),
          ],
        ),
      ),
    );
  }
}
