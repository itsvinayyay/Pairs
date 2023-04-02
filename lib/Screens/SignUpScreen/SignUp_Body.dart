import 'package:flutter/material.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Screens/SignInScreen/SignInScreen_Socials.dart';
import 'package:pairs/Screens/SignInScreen/SignIn_Divider.dart';

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
        )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getproportionatescreenwidth(60),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getproportionatescreenheight(40),
            ),
            Text(
              "Hey There!",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getproportionatescreenwidth(10),
              ),
              child: Text(
                "Register your account or Sign in using Social media handles",
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: "Roboto",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: getproportionatescreenheight(20),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Roboto-Medium",
                    ),
                    decoration: buildInputDecoration("Email", "Enter your Email"),
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(20),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Roboto-Medium",
                    ),
                    decoration:
                        buildInputDecoration("Password", "Enter your Password"),
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(20),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Roboto-Medium",
                    ),
                    decoration: buildInputDecoration(
                        "Confirm Password", "Confirm your Password"),
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(40),
                  ),
                  buildCommon_button(
                    onpressed: () {},
                    content: "Continue",
                    height: 60,
                    width: 590,
                  ),
                  SizedBox(height: getproportionatescreenheight(20),),
                  Socials_Divider(),
                  SizedBox(
                    height: getproportionatescreenheight(20),
                  ),
                  SignIn_Socials(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
