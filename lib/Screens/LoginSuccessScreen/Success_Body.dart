import 'package:flutter/material.dart';
import 'package:pairs/Bottom_Navigations.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Screens/HomeScreen/Home_Screen.dart';
import 'package:pairs/Screens/SignInScreen/SignIn_Divider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: build_background(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getproportionatescreenwidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              //TODO: can be implemented by this too!
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/images/5.png"),
              //     fit: BoxFit.cover,
              //
              //   ),
              // ),
              // width: MediaQuery.of(context).size.width,
              height: getproportionatescreenheight(350),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  "assets/images/ls.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // SizedBox(
            //   height: getproportionatescreenheight(50),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: getproportionatescreenwidth(500),
                  height: getproportionatescreenheight(100),
                  child: Text(
                    "You've been successfully logged in!\n"
                    "Proceed further",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontFamily: "JosefinSans-Regular",
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            buildCommon_button(
              onpressed: () {
                Navigator.pushNamed(context, Bottom_Navigations.id);
              },
              content: "Proceed",
              height: 60,
              width: 590,
            ),
            SizedBox(
              height: getproportionatescreenheight(40),
            ),

          ],
        ),
      ),
    );
  }
}
