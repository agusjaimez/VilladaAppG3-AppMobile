import 'dart:convert';

import 'package:comunicacion/compartido/constant.dart';
import 'package:comunicacion/screens/home/sidebar/formularios/enviar/api.dart';
import 'package:comunicacion/screens/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'enviar/datos.dart';
import 'firm.dart';

class F3 extends StatefulWidget with NavigationStates {
  @override
  _F3State createState() => _F3State();
}

class _F3State extends State<F3> {
  Future<EnvF> _envf;
  int alumno;
  String _descripcion;
  String _tipoform = "F3";
  String _dias = "Ingrese Fecha";
  String _hora;

  DateTime fecha() {
    var hoy = DateTime.now();
    var martes = 2;
    if (hoy.weekday <= martes) {
      hoy = DateTime(hoy.year, hoy.month, hoy.day - 2);
    }
    if (hoy.weekday > martes) {
      hoy = DateTime(hoy.year, hoy.month, hoy.day - 2);
    }
    return hoy;
  }

  static DateTime now = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPath(
                clipper: Clipper(),
                child: Container(
                  padding: EdgeInsets.only(left: 80, right: 10),
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.indigo.shade700,
                          Colors.indigo.shade300,
                        ]),
                  ),
                  child: Center(
                    child: Text(
                        'Formulario F3: Retiro Anticipado',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 10),
                child: Column(
                  children: [
                    SizedBox(height: 35),
                    Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Justifique el Retiro Anticipado '),
                        validator: (val) => val.isEmpty
                            ? 'Ingrese una justificacion adecuada'
                            : null,
                        onChanged: (val) {
                          setState(() => _descripcion = val);
                        },
                      ),
                    ),
                     SizedBox(height: 35),
                    Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Ingrese hora de retiro '),
                        validator: (val) =>
                            val.isEmpty ? 'Ingrese una hora adecuada' : null,
                        onChanged: (val) {
                          setState(() => _hora = val);
                        },
                      ),
                    ),
                    SizedBox(height: 35),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                              ),
                              showTitleActions: true,
                              minTime: fecha(),
                              maxTime: now, onConfirm: (date) {
                            print('confirm $date');
                            _dias = 'M ${date.month}  - D ${date.day}';
                            setState(() {});
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      size: 18.0,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      " $_dias",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('Seleccionar Fecha')
                            ],
                          ),
                        ),
                        color: Colors.white),
                    SizedBox(height: 35),
                    Material(
                        color: Color(0xFF00838F),
                        elevation: 18,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)),
                        clipBehavior: Clip.antiAlias,
                        child: MaterialButton(
                          minWidth: 200.0,
                          height: 50,
                          child: Text('Continuar',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white)),
                          color: Colors.indigo.shade300,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              alumno = await getAlumnoId();
                              var now = new DateTime.now();
                              var formatter = new DateFormat('yyyy-MM-dd');
                              String formattedDate = formatter.format(now);
                              print(_hora);

                              setState(() {
                                _envf = createEnvF(alumno, _descripcion,
                                    _tipoform, null, formattedDate, _hora);
                              });

                              showAlertDialog(BuildContext context) {
                                Widget okButton = FlatButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Wrapper()));
                                  },
                                );

                                AlertDialog alert = AlertDialog(
                                  title: Text("Formulario Enviado"),
                                  content: Text(
                                      "Su formulario ha sido enviado satisfactoriamente"),
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
                          },
                        )),
                    SizedBox(height: 50),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 70);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Future getAlumnoId() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final token = preferences.getString('token');
  List list;
  Response response = await get('http://10.0.2.2:8000/app/user/',
      headers: {'Authorization': 'Token ' + token});
  list = jsonDecode(response.body);
  return list[1]['id'];
}
