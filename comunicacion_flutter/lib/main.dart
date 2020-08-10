import 'package:comunicacion/screens/wrapper.dart';
import 'package:comunicacion/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comunicacion/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Auth().user,
      child: MaterialApp(
        title: 'Its_comunications',
        home: Wrapper(),
      ),
    );
  }
}
