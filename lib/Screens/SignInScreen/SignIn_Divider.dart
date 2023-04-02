import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';


class Socials_Divider extends StatelessWidget {
  const Socials_Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

