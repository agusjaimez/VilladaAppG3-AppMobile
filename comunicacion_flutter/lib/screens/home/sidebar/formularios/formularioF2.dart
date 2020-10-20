import 'package:comunicacion/compartido/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:comunicacion/screens/home/sidebar/formularios/firm.dart';

class F2 extends StatefulWidget with NavigationStates {
  @override
  _F2State createState() => _F2State();
}

class _F2State extends State<F2> {
  String _hora = "Seleccione Hora";
  // ignore: unused_field
  TextEditingController _nombre = new TextEditingController();

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
                      /*colors: [
                          Colors.indigo.shade700,
                          Colors.indigo.shade300,
                        ]*/
                    ),
                  ),
                  child: Center(
                    child: Text(
                        'Formulario F2: Retiro Anticipado por Causas Escolares',
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
                    Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      child: TextFormField(
                        controller: _nombre,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Nombre '),
                        // ignore: missing_return
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Ingrese un Nombre Adecuado';
                          }
                        },
                        /*
                        onSaved: (String value) {
                          _nombre = value;
                        },*/
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
                          DatePicker.showTimePicker(context,
                              showTitleActions: true, onChanged: (date) {
                            print('Change $date in time zone' +
                                date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirmar $date');
                            _hora = '${date.hour} H - ${date.minute} M';
                            setState(() {});
                          }, currentTime: DateTime.now());
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
                                      " $_hora",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('Hora Retiro')
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
                          onPressed: () {
                            postForm(_nombre.text, '', _hora,
                                "http://127.0.0.1:8000/app/apiformulario2");
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
