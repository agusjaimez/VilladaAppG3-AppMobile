import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:comunicacion/screens/modelPost/posts.dart';
import 'package:flutter/material.dart';
// import 'package:comunicacion/utils/Slide.dart';
// import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';




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
      appBar: AppBar(
        centerTitle: true,
        title: new Center(child: new Text("Comunicados", textAlign: TextAlign.center)),
        backgroundColor: Colors.indigo.shade300,
       ),
        /*GradientAppBar(
        centerTitle: true,
        title: new Center(child: new Text("Comunicados", textAlign: TextAlign.center)),
        backgroundColorStart: Colors.indigo.shade300,
        backgroundColorEnd: Colors.blue.shade600,
  ),*/
      body: Container(
        child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40), child: Posts()),
        )
          ),
          
          
          
    );
  }
}
