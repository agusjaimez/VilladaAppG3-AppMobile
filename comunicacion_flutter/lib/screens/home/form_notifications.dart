import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormNotification extends StatefulWidget {
  final Map data;
  FormNotification(this.data);

  @override
  _FormNotificationState createState() => _FormNotificationState();
}

class _FormNotificationState extends State<FormNotification> {
  bool checkBoxValue = false;
  String recibido = '';

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
          child: Column(children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.indigo.shade600,
                            Colors.indigo.shade300
                          ])),
                      child: Container(
                          width: double.infinity,
                          height: 150,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  widget.data['titulo'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      color: Colors.white,
                                      fontFamily: 'Comfortaa'),
                                ),
                              ]))),
                  Positioned.fill(
                    top: 120,
                    bottom: 330,
                    child: Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: Column(children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Directivo: " +
                                        widget.data['directivo']['first_name'] +
                                        " " +
                                        widget.data['directivo']['last_name']
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.data['fecha'].toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                      "Cursos: " +
                                          widget.data['curso']
                                              .join(", ")
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontStyle: FontStyle.italic)),
                                ],
                              )
                            ]))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          widget.data['mensaje'],
                          style: TextStyle(
                            fontSize: 22.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              onChanged: (bool value) {
                                print(value);
                                if (value == true) {
                                  setState(() {
                                    recibido = 'True';
                                  });
                                } else {
                                  setState(() {
                                    recibido = 'False';
                                  });
                                }
                                setState(() {
                                  checkBoxValue = value;
                                  comunicadoRecibido(
                                      recibido, widget.data['id']);
                                });
                              },
                              value: checkBoxValue,
                            ),
                            Text("Me doy por Notificado/a")
                          ],
                        ),
                      ],
                    ),
                  ),
                ])),
          ]),
        ),
      ),
    );
  }
}

Future comunicadoRecibido(recibido, id) async {
  print("TUVIEJAA");
  print(recibido);
  print(id);

  SharedPreferences preferences = await SharedPreferences.getInstance();
  final token = preferences.getString('token');
  Response response = await post(
      'http://10.0.2.2:8000/app/comunicado_recibido/',
      headers: {'Authorization': 'Token ' + token},
      body: {'recibido': recibido, 'comunicado': id.toString()});
  print(response.body);
}
