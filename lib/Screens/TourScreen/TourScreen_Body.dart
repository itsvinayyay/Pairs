import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: getproportionatescreenheight(100),
              width: getproportionatescreenwidth(200),
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}
