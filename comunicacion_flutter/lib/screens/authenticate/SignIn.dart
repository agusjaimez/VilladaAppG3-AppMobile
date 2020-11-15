import 'dart:convert';
import 'package:comunicacion/screens/home/principal.dart';
import 'package:comunicacion/screens/home/sidebar/sideBar_layout.dart';
import 'package:flutter/material.dart';
import 'package:comunicacion/compartido/loading.dart';
import 'package:comunicacion/services/auth.dart';
import 'package:comunicacion/compartido/constant.dart';
import 'package:comunicacion/compartido/its_Img.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:get_ip/get_ip.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final Auth _auth = Auth();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Color(0xfffafafa),
            appBar: AppBar(
                title: const Text('Iniciar Sesion'),
                backgroundColor: Color(0xff1a237e),
                actions: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        widget.toggleView();
                      },
                      icon: Icon(Icons.person, color: Colors.white),
                      label: Text(
                        'Registrarse',
                        style: TextStyle(color: Colors.white),
                      ))
                ]),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 25),
                    its_img,
                    SizedBox(height: 25),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          TextFormField(
                            validator: (val) => val.isEmpty
                                ? 'Ingrese un email correcto'
                                : null,
                            onChanged: (val) async {
                              setState(() => email = val);
                            },
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Ingrese una contraseña mas segura'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 45),
                    MaterialButton(
                        height: 45,
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(fontSize: 25),
                        ),
                        color: Colors.white,
                        elevation: 6,
                        shape: StadiumBorder(),
                        onPressed: () async {
                          var ipAddress = getDeviceIpAddress();
                          var _token = getToken(email, password);
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();

                          if (await _token != null) {
                            pref.setString('token', await _token);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SideBarLayout()));
                          } else if (await _token == null) {
                            print("xd");
                            showAlertDialog(BuildContext context) {
                              Widget okButton = FlatButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              );

                              AlertDialog alert = AlertDialog(
                                title: Text("Usuario incorrecto"),
                                content: Text(
                                    "Ingresa un email y una contraseña validos"),
                                actions: [
                                  okButton,
                                ],
                              );

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                },
                              );
                            }

                            return showAlertDialog(context);
                          }
                        }),
                    SizedBox(height: 10),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14)),
                  ],
                ),
              ),
            ),
          );
  }
}

Future getToken(username, password) async {
  print(username);
  print(password);
  Response response = await post('http://10.0.2.2:8000/api-token-auth/',
      body: {"username": username, "password": password});
  Map tokenMap = jsonDecode(response.body);
  String token = tokenMap["token"];
  print(token);
  return token;
}

getDeviceIpAddress() async {
  String ipAddress = await GetIp.ipAddress;
  print(ipAddress);
  return ipAddress;
}
