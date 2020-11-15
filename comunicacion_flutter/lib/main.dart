import 'package:comunicacion/screens/authenticate/SignIn.dart';
import 'package:comunicacion/screens/home/principal.dart';
import 'package:comunicacion/screens/home/sidebar/sideBar.dart';
import 'package:comunicacion/screens/home/sidebar/sideBar_layout.dart';
import 'package:comunicacion/screens/wrapper.dart';
import 'package:comunicacion/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comunicacion/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final token = preferences.getString('email');
  print("TOKEEEN");
  print(token);
  runApp(MaterialApp(home: token==null ? SignIn() : SideBarLayout()));
}

//class MyApp extends StatefulWidget {
 // @override
 // _MyAppState createState() => _MyAppState();
//}

//class _MyAppState extends State<MyApp> {
  //@override
  //Widget build(BuildContext context) {
    //return StreamProvider<User>.value(
      //value: Auth().user,
      //child: MaterialApp(
        //debugShowCheckedModeBanner: false,
        //title: 'Its_comunications',
        //home: email==null ? SingIn() : Principal(),
      //),
    //);
  //}
//}
