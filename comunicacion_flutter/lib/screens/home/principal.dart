import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:comunicacion/screens/modelPost/posts.dart';
import 'package:flutter/material.dart';
// import 'package:comunicacion/utils/Slide.dart';
// import 'package:bouncing_widget/bouncing_widget.dart';

class Principal extends StatefulWidget with NavigationStates {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  bool enabled = false;

  // double _scaleFactor = 2.0;

  // _onPressedW(BuildContext context) {
  //   print("CLICK");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 35), child: Posts()),
    );
  }
}
