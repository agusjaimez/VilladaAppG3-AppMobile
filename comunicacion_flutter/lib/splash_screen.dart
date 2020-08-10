import 'package:flutter/material.dart';
import 'dart:async';
import 'package:comunicacion/widgetOrigen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WidgetOrigen()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('assets/formulario.jpg'),
            ),
            Padding(padding: EdgeInsets.only(top: 20, left: 10)),
            Text(
              'Hello, I am a Splash Screen, xd',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            ),
          ],
        ),
      ),
    );
  }
}
