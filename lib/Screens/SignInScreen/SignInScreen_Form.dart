import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Screens/LoginSuccessScreen/Succeess_Screen.dart';
import 'package:pairs/Screens/SignInScreen/SignInScreen_Errors.dart';
import 'package:pairs/Screens/SignUpScreen/SignUp_Screen.dart';
import 'SignInScreen_Socials.dart';
import 'SignIn_Divider.dart';


class SignInScreen_Form extends StatefulWidget {
  const SignInScreen_Form({
    super.key,
  });

  @override
  State<SignInScreen_Form> createState() => _SignInScreen_FormState();
}

class _SignInScreen_FormState extends State<SignInScreen_Form> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final List<String> Errors = [];
   late String? received_email;
   late String? received_password;
    final _auth = FirebaseAuth.instance;

    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newvalue) {
              received_email = newvalue;
            },
            onChanged: (value) {
              if (value.isNotEmpty && Errors.contains(kemailnullerror)) {
                setState(() {
                  Errors.remove(kemailnullerror);
                });
              } else if (value.contains("@") && Errors.contains(kvalidemailerror)) {
                setState(() {
                  Errors.remove(kvalidemailerror);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !Errors.contains(kemailnullerror)) {
                setState(() {
                  Errors.add(kemailnullerror);
                });
              } else if (value != null &&
                  !value.contains("@") &&
                  !Errors.contains(kvalidemailerror) &&
                  !Errors.contains(kemailnullerror)) {
                setState(() {
                  Errors.add(kvalidemailerror);
                });
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
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
            onSaved: (newvalue) {
              received_password = newvalue;
            },
            onChanged: (value) {
              if (value != null &&
                  value.isNotEmpty &&
                  Errors.contains(knullpasserror)) {
                setState(() {
                  Errors.remove(knullpasserror);
                });
              } else if (value != null &&
                  value.length > 6 &&
                  Errors.contains(kshortpass)) {
                setState(() {
                  Errors.remove(kshortpass);
                });
              }
              return null;
            },
            validator: (value) {
              if (value != null &&
                  value.isEmpty &&
                  !Errors.contains(knullpasserror)) {
                setState(() {
                  Errors.add(knullpasserror);
                });
              } else if (value != null &&
                  value.length < 6 &&
                  !Errors.contains(kshortpass) &&
                  !Errors.contains(knullpasserror)) {
                setState(() {
                  Errors.add(kshortpass);
                });
              }
              return null;
            },
            obscureText: true,
            autofocus: false,
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
              FormErrors(Errors: Errors),
              SizedBox(
                width: getproportionatescreenwidth(10),
              ),
            ],
          ),
          SizedBox(
            height: getproportionatescreenheight(40),
          ),
          buildCommon_button(
            onpressed: () async{
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
                if (Errors.isEmpty) {
                  try{
                    final newuser = await _auth.signInWithEmailAndPassword(email: received_email!, password: received_password!);
                    if(newuser != null){
                      Navigator.pushNamed(context, LoginSuccess.id);
                    }
                  }
                  catch(exception){
                    print(exception);
                  }
                }
              }

            },
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

