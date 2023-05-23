import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Common_Button.dart';
import '../../Constants.dart';
import '../../Screen_Config.dart';
import '../OTPScreen/OTP_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Registration_Form extends StatefulWidget {
  const Registration_Form({
    super.key,
  });

  @override
  State<Registration_Form> createState() => _Registration_FormState();
}

class _Registration_FormState extends State<Registration_Form> {
  late final _firestore;
  final _auth = FirebaseAuth.instance;
  User? LoggedInuser;
  late String first_name;
  late String last_name;
  late String phone;
  String countrycode = "+91";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser;
      if (user != null) {
        LoggedInuser = user;
        print(LoggedInuser?.email);
        _firestore = FirebaseFirestore.instance.collection("UserData").doc(LoggedInuser?.uid);
      }
    }

    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children: [
          TextFormField(
            onChanged: (value){
              first_name = value;
            },
            decoration: buildInputDecoration(
                "First Name", "Enter your first name"),
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Roboto-Medium",
            ),
          ),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          TextFormField(
            onChanged: (value){
              last_name = value;
            },
            decoration: buildInputDecoration(
                "Last Name", "Enter your last name"),
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Roboto-Medium",
            ),
          ),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          TextFormField(
            onChanged: (value){
              phone = value;
            },
            decoration:
            buildInputDecoration("Phone Number", "Phone Number"),
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Roboto-Medium",
            ),
          ),
          SizedBox(
            height: getproportionatescreenheight(40),
          ),
          buildCommon_button(
            onpressed: () async{
              await _firestore.set({
                'First_Name': first_name,
                'Last_Name': last_name,
                'Phone': (countrycode + phone),
              });
              await _auth.verifyPhoneNumber(
                phoneNumber: (countrycode + phone),
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException e) {},
                codeSent: (String verificationId, int? resendToken) {
                  print(verificationId);
                  Navigator.pushNamed(context, OTP_Screen.id, arguments: phoneNumber_arg(phoneNumber: phone, verificationID: verificationId),);

                },
                codeAutoRetrievalTimeout: (String verificationId) {},
              );
              print(first_name);
              print(last_name);
              print(phone);

            },
            content: "Continue",
            height: 60,
            width: 590,
          ),
        ],
      ),
    );
  }
}
