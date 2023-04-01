import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back.png"),
          fit: BoxFit.cover,
          alignment: Alignment.topRight,
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
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            SizedBox(
              height: getproportionatescreenheight(30),
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
                    decoration:
                        buildInputDecoration("Email", "Enter your email here"),
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
                        "Password", "Enter your password here"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.green,
                          thickness: 6,
                        ),
                        flex: 3,
                      ),
                      SizedBox(
                        width: getproportionatescreenwidth(8),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Or",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Divider(
                          color: Colors.green,
                          thickness: 6,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSocial_Icons("s2"),
                      buildSocial_Icons("s1"),
                      buildSocial_Icons("s3"),
                    ],
                  ),
                  SizedBox(height: getproportionatescreenheight(10),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getproportionatescreenwidth(120)),
                    child: Text(
                      "Or Sign-in using your social media handles",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSocial_Icons(String imagename) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      height: getproportionatescreenheight(80),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset("assets/images/$imagename.png"),
      ),
    );
  }
}
