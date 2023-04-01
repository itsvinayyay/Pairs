import 'package:flutter/material.dart';
import 'Screen_Config.dart';

class buildCommon_button extends StatelessWidget {
  late VoidCallback onpressed;
  late String content;
  buildCommon_button({required this.onpressed, required this.content, this.height = 80, this.width = 650});
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        height: getproportionatescreenheight(height),
        width: getproportionatescreenwidth(width),
        child: Text(
          content,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
