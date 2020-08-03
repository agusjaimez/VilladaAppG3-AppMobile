import 'package:flutter/material.dart';
import 'package:comunicacion/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Its_comunications',
      home: SplashScreen(),
    );
  }
}
