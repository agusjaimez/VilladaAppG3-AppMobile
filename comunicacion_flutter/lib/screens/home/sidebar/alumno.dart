
import 'dart:html';

import 'package:flutter/material.dart';


class Alumno extends StatelessWidget {
 

  final Map data;

  Alumno(this.data);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Container(
                    
                    width: double.infinity,
                    height: 200.0,
                    child: ListView(
                      
                      children: <Widget>[
                        
                        SizedBox(
                          height: 20,
                        ),
                        
                        
                        Text("Alumno: "+data['first_name']+" "+data['last_name'] .toString(), style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                        SizedBox( height: 10, ),
                        Text("Curso: "+data['curso'].toString(), style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                        SizedBox( height: 10, ),
                        Text("Dni: "+data['dni'].toString(), style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                        SizedBox( height: 10, ),
                        Text("Tutor: "+data['tutor']["first_name"]+" "+data['tutor']["last_name"].toString(), style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal,),),
                        SizedBox(height: 30,),
                       
                        
                        
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );


  }
  
}
