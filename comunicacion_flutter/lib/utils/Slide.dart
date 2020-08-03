import 'package:flutter/material.dart';

class SlideDuration extends PageRouteBuilder {
  Widget widget;
  SlideDuration({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            Animation<Offset> custom =
                Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation);
            return SlideTransition(position: custom, child: child);
          },
        );
}
