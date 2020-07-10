import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:date_field/date_field.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';


//DateTime selectedData;

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
              /*Container(
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
              */
              SizedBox(height: 50),
              Container(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration:
                      InputDecoration(hintText: 'Justifique de la falta'),
                ),
              ),
              SizedBox(height: 35),
              MaterialButton(
                child: const Text('Enviar', style: TextStyle(fontSize: 25)),
                color: Colors.blue,
                elevation: 6,
                shape: StadiumBorder(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class F2 extends StatefulWidget {
  @override
  _F2State createState() => _F2State();
}


class _F2State extends State<F2> {
  DateTime date3;


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
              DateTimePickerFormField(
                inputType: InputType.time,
                format: DateFormat("HH:mm"),
                initialTime: TimeOfDay(hour: 5, minute: 5),
                editable: false,
                decoration: InputDecoration(
                    labelText: 'Time', hasFloatingPlaceholder: false),
                onChanged: (dt) {
                  setState(() => date3 = dt);
                  print('Selected date: $date3');
                  print('Hour: $date3.hour');
                  print('Minute: $date3.minute');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class F3 extends StatefulWidget {
  @override
  _F3State createState() => _F3State();
}

class _F3State extends State<F3> {
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
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
