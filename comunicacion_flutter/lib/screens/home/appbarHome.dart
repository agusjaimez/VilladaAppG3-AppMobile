import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          menu(context),
          // dashboard(context),
        ],
      ),
    );
  }
}

Widget menu(context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      children: <Widget>[Text('Dashboard')],
    ),
  );
}
