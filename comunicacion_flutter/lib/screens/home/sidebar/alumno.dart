import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:comunicacion/screens/modelPost/posts.dart';



class Alumno extends StatefulWidget with NavigationStates {
  @override
  _AlumnoState createState() => _AlumnoState();
}

class _AlumnoState extends State<Alumno> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Center(child: new Text("Alumnos", textAlign: TextAlign.center)),
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
          padding: EdgeInsets.symmetric(horizontal: 40), child: Posts()
          ),
        )
          ),
          
          
          
    );


  }
}