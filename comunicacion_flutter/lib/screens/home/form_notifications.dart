import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class FormNotification extends StatelessWidget {


  final  Map data;

 
  FormNotification(this.data);

 

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
                          height: 35.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            data['titulo'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 35.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        
                        SizedBox(
                          height: 20,
                        ),
                        Text("Directivo: "+data['directivo']['first_name']+" "+data['directivo']['last_name'] .toString(), style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),),
                        SizedBox( height: 10, ),
                        Text("Fecha: "+data['fecha'].toString(), style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),),
                        SizedBox( height: 10, ),
                        Text("Cursos: "+data['curso'].join(", ").toString(), style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic,),),
                        SizedBox(height: 30,),
                       
                        Text(data['mensaje'],
                        
                          style: TextStyle(
                            fontSize: 22.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            letterSpacing: 2.0,
                          ),
                        ),
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

