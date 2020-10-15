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
                              fontStyle: FontStyle.italic,
                              fontSize: 40.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            data['fecha'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Text(data['directivo'].toString()),
                        Text(data['curso'].toString()),
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

