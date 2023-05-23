import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Screens/RegistrationScreen/Registration_Screen.dart';
import 'package:pairs/Screens/SignInScreen/SignInScreen_Socials.dart';
import 'package:pairs/Screens/SignInScreen/SignIn_Divider.dart';

class SignUp_Form extends StatefulWidget {


  @override
  State<SignUp_Form> createState() => _SignUp_FormState();
}

class _SignUp_FormState extends State<SignUp_Form> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String Password;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            onChanged: (value){
              email = value;
            },
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Roboto-Medium",
            ),
            decoration:
            buildInputDecoration("Email", "Enter your Email"),
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
            onChanged: (value){
              Password = value;
            },
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
            onpressed: () async{
              try{
                final newuser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: Password);
                if (newuser != null) {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }
              }
              catch(e){
                print(e);
              }
            },
            content: "Continue",
            height: 60,
            width: 590,
          ),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          Socials_Divider(),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          SignIn_Socials(),
        ],
      ),
    );
  }
}
