import 'package:flutter/material.dart';
import 'package:pairs/Constants.dart';
import 'package:pairs/Screen_Config.dart';
import 'RegistrationScreen_Form.dart';

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
              "Registration Completion",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getproportionatescreenwidth(10),
              ),
              child: Text(
                "Fill in the below fields in order to complete your registration",
                style: TextStyle(
                    color: Colors.green,
                    fontFamily: "Roboto",
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: getproportionatescreenheight(20),
            ),
            Registration_Form(),
          ],
        ),
      ),
    );
  }
}

