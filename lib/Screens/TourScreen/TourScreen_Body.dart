import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController _controller = PageController(initialPage: 0);
  late Timer _timer;
  int currentpage = 0;

  List<Widget> Images = [
    Container(
      height: getproportionatescreenheight(400),
      width: getproportionatescreenwidth(600),
      color: Color(0xFFDDDCDD),
      child: Image.asset("assets/images/1.png"),
    ),
    Container(
      height: getproportionatescreenheight(400),
      width: getproportionatescreenwidth(600),
      color: Color(0xFFDDDCDD),
      child: Image.asset("assets/images/2.png"),
    ),
    Container(
      height: getproportionatescreenheight(400),
      width: getproportionatescreenwidth(600),
      color: Color(0xFFDDDCDD),
      child: Image.asset("assets/images/3.png"),
    ),
    Container(
      height: getproportionatescreenheight(400),
      width: getproportionatescreenwidth(600),
      color: Color(0xFFDDDCDD),
      child: Image.asset("assets/images/4.png"),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        if (currentpage < 3) {
          currentpage++;
        } else {
          currentpage = 0;
        }

        _controller.animateToPage(currentpage,
            duration: Duration(seconds: 1), curve: Curves.easeInOut);
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: getproportionatescreenheight(400),
          child: PageView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: [
              ...List.generate(
                Images.length,
                (index) => Images[index],
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          height: getproportionatescreenheight(80),
          width: getproportionatescreenwidth(600),
          child: Text(
            "Continue",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        )
      ],
    );
  }
}
