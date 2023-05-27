import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Screens/RegistrationScreen/Registration_Screen.dart';
import 'package:pairs/Screens/SignInScreen/SignInScreen_Socials.dart';
import 'package:pairs/Screens/SignInScreen/SignIn_Divider.dart';
import 'package:pairs/Screens/SignUpScreen/SignUpScreen_Errors.dart';

class SignUp_Form extends StatefulWidget {
  @override
  State<SignUp_Form> createState() => _SignUp_FormState();
}

class _SignUp_FormState extends State<SignUp_Form> {
  final _formkey = GlobalKey<FormState>();
  final List<String> Errors = [];
  final _auth = FirebaseAuth.instance;
  late String? email;
  late String? Password;
  late String? ConfirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newvalue) {
              email = newvalue;
            },
            onChanged: (value) {
              if (value.isNotEmpty && Errors.contains(kemailnullerror)) {
                setState(() {
                  Errors.remove(kemailnullerror);
                });
              } else if (value.contains("@") &&
                  Errors.contains(kvalidemailerror)) {
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
            onSaved: (newvalue) {
              Password = newvalue;
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
              Password = value;
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
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Roboto-Medium",
            ),
            decoration: buildInputDecoration("Password", "Enter your Password"),
          ),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          TextFormField(
            onSaved: (value) {
              ConfirmPassword = value;
            },
            onChanged: (value) {
              if (value != null &&
                  value.isNotEmpty &&
                  Errors.contains(kconfpassnull)) {
                setState(() {
                  Errors.remove(kconfpassnull);
                });
              } else if (value != null &&
                  value == Password &&
                  Errors.contains(knopassmatch)) {
                setState(() {
                  Errors.remove(knopassmatch);
                });
              }
              return null;
            },
            validator: (value) {
              if (value != null &&
                  value.isEmpty &&
                  !Errors.contains(kconfpassnull) &&
                  !Errors.contains(knullpasserror)) {
                setState(() {
                  Errors.add(kconfpassnull);
                });
              } else if (value != null &&
                  value != Password &&
                  !Errors.contains(knopassmatch) &&
                  !Errors.contains(kconfpassnull)) {
                setState(() {
                  Errors.add(knopassmatch);
                });
              }
              return null;
            },
            obscureText: true,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Roboto-Medium",
            ),
            decoration: buildInputDecoration(
                "Confirm Password", "Confirm your Password"),
          ),
          Signupform_errors(Errors: Errors),
          SizedBox(
            height: getproportionatescreenheight(40),
          ),
          buildCommon_button(
            onpressed: () async {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
                if (Errors.isEmpty) {
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email!, password: ConfirmPassword!);
                    if (newuser != null && Errors.isEmpty) {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                }
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
