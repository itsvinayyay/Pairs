import 'package:flutter/material.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Screen_Config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getproportionatescreenheight(40),
            ),
            Form(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getproportionatescreenwidth(150),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "Roboto-Medium",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getproportionatescreenwidth(150),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "Roboto-Medium",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getproportionatescreenwidth(150),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "Roboto-Medium",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getproportionatescreenwidth(150),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "Roboto-Medium",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(30),
                  ),
                  Text(
                    "OTP has been sent to your mobile number entered previuosly!",
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
                        builder:
                            (BuildContext context, double val, Widget? child) {
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
                  buildCommon_button(onpressed: () {}, content: "Verify", width: 590, height: 60,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}