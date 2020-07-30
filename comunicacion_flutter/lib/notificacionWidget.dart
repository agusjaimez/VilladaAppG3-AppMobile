import 'package:flutter/material.dart';

class Notificacion extends StatefulWidget {
  @override
  _NotificacionState createState() => _NotificacionState();
}

class _NotificacionState extends State<Notificacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Go back'),
      )),
    );
  }
}
