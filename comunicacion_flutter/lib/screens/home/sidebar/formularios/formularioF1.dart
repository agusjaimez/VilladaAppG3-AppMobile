import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:comunicacion/compartido/constant.dart';

class F1 extends StatefulWidget with NavigationStates {
  @override
  _F1State createState() => _F1State();
}

class _F1State extends State<F1> {
  String _date = "Seleccione Fecha";
  // ignore: unused_field
  String _nombre;
  // ignore: unused_field
  String _justificacion;

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
                    color: Colors.blue.shade300,
                  ),
                  child: Center(
                    child: Text('Formulario F1: Justificar faltas del Alumno',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 10),
                child: Column(
                  children: [
                    Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      child: TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Nombre '),
                        // ignore: missing_return
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Ingrese un Nombre Adecuado';
                          }
                        },
                        onSaved: (String value) {
                          _nombre = value;
                        },
                        onChanged: (value) {
                          setState(() {});
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
                            hintText: 'Justifique la Falta '),
                        // ignore: missing_return
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Ingrese un Nombre Adecuado';
                          }
                        },
                        onSaved: (String value) {
                          _justificacion = value;
                        },
                        onChanged: (value) {
                          setState(() {});
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
                              minTime: DateTime(2020, 1, 1),
                              maxTime: DateTime(2020, 12, 31),
                              onConfirm: (date) {
                            print('confirm $date');
                            _date = 'M ${date.month}  - D ${date.day}';
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
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      " $_date",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('Selecionar Fecha')
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
                          height: 35,
                          child: Text('Enviar',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white)),
                          color: Color(0xFF00838F),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
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
