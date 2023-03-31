import 'package:flutter/material.dart';

class FadeinTransitions extends StatelessWidget {
  FadeinTransitions(
      {required this.passedchild,
      this.leftP = 0,
      this.rightP = 0,
      this.topP = 0,
      this.bottomP = 0});

  late Widget passedchild;
  double leftP;
  double rightP;
  double topP;
  double bottomP;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: passedchild,
      tween: Tween<double>(
        begin: 0,
        end: 1,
      ),
      duration: Duration(seconds: 3),
      builder: (context, double _val, Widget? child) {
        return Opacity(
          opacity: _val,
          child: Padding(
            padding: EdgeInsets.only(
              left: leftP * _val,
              right: rightP * _val,
              top: topP * _val,
              bottom: bottomP * _val,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
