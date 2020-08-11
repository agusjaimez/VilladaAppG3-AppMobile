import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class F1 extends StatefulWidget {
  @override
  _F1State createState() => _F1State();
}

class _F1State extends State<F1> {
  DateTime _dateF1 = new DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _dateF1,
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2022));

    if (picked != null && picked != _dateF1) {
      print('Date Selected: ${_dateF1.toString()}');
      setState(() {
        _dateF1 = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: Center(
        child: Container(
          width: 330,
          height: 470,
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
              Text('Date Selected: ${_dateF1.toString()}'),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Select Date'),
                onPressed: () {
                  _selectDate(context);
                },
              ),
              SizedBox(height: 35),
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
                onPressed: null,
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
  DateTime _dateF2 = new DateTime.now();
  TimeOfDay _timeF2 = new TimeOfDay.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _dateF2,
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2022));

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != _dateF2) {
      print('Date Selected: ${_dateF2.toString()}');
      setState(() {
        _dateF2 = picked;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _timeF2);

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != _timeF2) {
      print('Time Selected: ${_timeF2.toString()}');
      setState(() {
        _timeF2 = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: Center(
        child: Container(
          width: 330,
          height: 470,
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
              SizedBox(height: 35),
              Text('Date Selected: ${_dateF2.toString()}'),
              RaisedButton(
                child: Text('Select Date'),
                onPressed: () {
                  _selectDate(context);
                },
              ),
              SizedBox(height: 35),
              Text('Date Selected: ${_timeF2.toString()}'),
              RaisedButton(
                child: Text('Select Time'),
                onPressed: () {
                  _selectTime(context);
                },
              ),
              SizedBox(height: 35),
              RaisedButton(
                child: Text('Enviar'),
                onPressed: null,
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
  DateTime _dateF3 = new DateTime.now();
  TimeOfDay _timeF3 = new TimeOfDay.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _dateF3,
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2022));

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != _dateF3) {
      print('Date Selected: ${_dateF3.toString()}');
      setState(() {
        _dateF3 = picked;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _timeF3);

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != _timeF3) {
      print('Time Selected: ${_timeF3.toString()}');
      setState(() {
        _timeF3 = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: Center(
        child: Container(
          width: 330,
          height: 470,
          decoration: BoxDecoration(
            color: Color(0xffd6d6d6),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
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
              SizedBox(height: 35),
              Text('Date Selected: ${_dateF3.toString()}'),
              RaisedButton(
                child: Text('Select Date'),
                onPressed: () {
                  _selectDate(context);
                },
              ),
              SizedBox(height: 35),
              Text('Date Selected: ${_timeF3.toString()}'),
              RaisedButton(
                child: Text('Select Time'),
                onPressed: () {
                  _selectTime(context);
                },
              ),
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
              RaisedButton(
                child: Text('Enviar'),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
