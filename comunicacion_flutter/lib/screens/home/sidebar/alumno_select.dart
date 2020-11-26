import 'dart:convert';

import 'package:comunicacion/screens/home/sidebar/alumno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comunicacion/block_navigation_block/navigation_block.dart';

import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlumnoSelect extends StatefulWidget with NavigationStates {
  @override
  _AlumnoSelectState createState() => _AlumnoSelectState();
}

class _AlumnoSelectState extends State<AlumnoSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            new Center(child: new Text("Alumnos", textAlign: TextAlign.center)),
        backgroundColor: Colors.indigo.shade300,
      ),
      body: StreamBuilder(
          stream: Stream.periodic(Duration(seconds: 5)).asyncMap(
              (i) => getAlumnos()), // i is null here (check periodic docs)
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  print(snapshot.data);
                  if (index != 0) {
                    return Card(
                        child: ListTile(
                      title: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(snapshot.data[index]['first_name'] +
                              " " +
                              snapshot.data[index]['last_name']),
                        ),
                      ),
                      leading: SizedBox(width: 5),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: null,
                      ),
                      onTap: () {
                        Navigator.push(context, PageRouteBuilder(pageBuilder:
                            (BuildContext context, Animation<double> animation,
                                Animation<double> secAnimaiton) {
                          return Alumno(snapshot.data[index]);
                        }));
                      },
                    ));
                  }
                  else{
                    return Text("");
                  }
                },
              );
            } else {
              final spinkit = SpinKitChasingDots(color: Colors.indigo.shade300);
              return Container(
                  child: Center(
                child: spinkit,
              ));
            }
          }), // builder should also handle the case when data is not fetched yet
    );
  }
}

Future getAlumnos() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final token = preferences.getString('token');
  List list;
  Response response = await get('http://10.0.2.2:8000/app/user/',
      headers: {'Authorization': 'Token ' + token});
  list = jsonDecode(response.body);
  return list;
}
