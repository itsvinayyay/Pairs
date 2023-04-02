import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Screens/SignUpScreen/SignUp_Screen.dart';
import 'SignInScreen_Socials.dart';
import 'SignIn_Divider.dart';

class SignInScreen_Form extends StatelessWidget {
  const SignInScreen_Form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Roboto-Medium",
            ),
            decoration: buildInputDecoration("Email", "Enter your email here"),
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
                buildInputDecoration("Password", "Enter your password here"),
          ),
          SizedBox(
            height: getproportionatescreenheight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto-Medium",
                ),
              ),
              SizedBox(
                width: getproportionatescreenwidth(10),
              ),
            ],
          ),
          SizedBox(
            height: getproportionatescreenheight(40),
          ),
          buildCommon_button(
            onpressed: () {},
            content: "Log In",
            height: 60,
            width: 590,
          ),
          SizedBox(
            height: getproportionatescreenheight(30),
          ),
          Socials_Divider(),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          SignIn_Socials(),
          SizedBox(
            height: getproportionatescreenheight(10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getproportionatescreenwidth(120)),
            child: Text(
              "Sign-in using your social media handles \n or",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SignUpScreen.id);
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "Roboto",
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}

