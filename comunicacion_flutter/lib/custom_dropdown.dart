import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

DateTime selectedData;

class F1 extends StatefulWidget {
  @override
  _F1State createState() => _F1State();
}

class _F1State extends State<F1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: Center(
        child: Container(
          width: 330,
          height: 425,
          decoration: BoxDecoration(
            color: Color(0xffd6d6d6),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Container(
                width: 270,
                child: TextField(
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Nombre del Alumno',
                    fillColor: Colors.grey,
                    filled: true,
                    contentPadding:
                        new EdgeInsets.fromLTRB(5.0, 30.0, 10.0, 10.0),
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(12.0)),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 270,
                child: DateField(
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedData = value;
                    });
                  },
                  selectedDate: selectedData,
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'Justifique la falta de su hijo'),
                ),
              ),
              SizedBox(height: 35),
              MaterialButton(
                child: const Text('Enviar', style: TextStyle(fontSize: 25)),
                color: Colors.blue,
                elevation: 6,
                shape: StadiumBorder(),
                onPressed: (){

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class F2 extends StatelessWidget {
  const F2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class F3 extends StatelessWidget {
  const F3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
