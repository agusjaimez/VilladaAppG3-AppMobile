import 'package:comunicacion/principal.dart';
import 'package:comunicacion/widgetOrigen.dart';
import 'package:flutter/material.dart';
import 'package:comunicacion/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Its_comunications',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        'logScreen': (BuildContext context) => WidgetOrigen(),
        'principal': (BuildContext context) => Principal(),
      },
    );
    return materialApp;
  }
}
