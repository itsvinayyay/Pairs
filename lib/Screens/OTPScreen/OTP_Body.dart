import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Screens/HomeScreen/Home_Screen.dart';
import 'package:pairs/Screens/LoginSuccessScreen/Succeess_Screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Body extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String PhoneNumber;
  String verify;
  Body({required this.PhoneNumber, required this.verify});
  late String received_OTP;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: build_background(),
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
              "Verify your OTP",
              style: build_Headings(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getproportionatescreenheight(40),
            ),
            PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                received_OTP = value;
              },
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto",
                fontSize: 30,
              ),

              showCursor: false,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                activeColor: Colors.green,
                selectedColor: Colors.green.shade700,
                inactiveColor: Colors.grey.shade700,
                borderRadius: BorderRadius.all(Radius.circular(20),),
                borderWidth: 3.0,
                fieldHeight: 60,
                fieldWidth: 50,
              ),
            ),
            SizedBox(
              height: getproportionatescreenheight(30),
            ),
            Text(
              "OTP has been sent to your mobile number entered $PhoneNumber",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getproportionatescreenheight(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This OTP will get expired in: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 30.00, end: 00.00),
                  duration: Duration(seconds: 30),
                  builder: (BuildContext context, double val, Widget? child) {
                    return Text(
                      "${val.toInt()}:00",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: getproportionatescreenheight(10),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Resend OTP",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: getproportionatescreenheight(40),
            ),
            customButton(onPressed: () async{
              // Create a PhoneAuthCredential with the code
              // print(verify);
              try{
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verify, smsCode: received_OTP);

                // Sign the user in (or link) with the credential
                await _auth.signInWithCredential(credential);
                Navigator.pushNamed(context, LoginSuccess.id);
              }
              catch(e){
                print("Wrong OTP!");
              }
            }, title: "Verify"),
          ],
        ),
      ),
    );
  }
}
