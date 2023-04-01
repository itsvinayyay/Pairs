import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Fadein_Transitions.dart';
import 'package:pairs/Screens/SignInScreen/SignIn_Screen.dart';
import 'package:pairs/Common_Button.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
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
        SizedBox(
          height: getproportionatescreenheight(100),
        ),
        FadeinTransitions(
          leftP: 40,
          passedchild: Row(
            children: [
              Text(
                "Pairs...",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 80,
                  fontFamily: "JosefinSans-italic",
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: getproportionatescreenwidth(20),
              ),
              Container(
                height: getproportionatescreenheight(70),
                child: AspectRatio(
                  child: Image.asset("assets/images/logo.png"),
                  aspectRatio: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getproportionatescreenheight(30),
        ),
        FadeinTransitions(
          leftP: 50,
          rightP: 50,
          passedchild: buildCommon_button(onpressed: (){
            Navigator.pushNamed(context, SignInScreen.id);
          }, content: "Continue",),
        ),
      ],
    );
  }
}

