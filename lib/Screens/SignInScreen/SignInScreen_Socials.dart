import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';

class SignIn_Socials extends StatelessWidget {
  const SignIn_Socials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildSocial_Icons("s2"),
        buildSocial_Icons("s1"),
        buildSocial_Icons("s3"),
      ],
    );
  }
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
