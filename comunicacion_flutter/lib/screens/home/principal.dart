import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:flutter/material.dart';
// import 'package:comunicacion/utils/Slide.dart';
// import 'package:bouncing_widget/bouncing_widget.dart';
import 'dart:convert';
import 'package:comunicacion/screens/home/form_notifications.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

class Principal extends StatefulWidget with NavigationStates {
  final token;
  const Principal({Key key, this.token}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();

}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Center(
            child: new Text("Comunicados", textAlign: TextAlign.center)),
        backgroundColor: Colors.indigo.shade300,
      ),
      body: StreamBuilder(
          stream: Stream.periodic(Duration(seconds: 5))
              .asyncMap((i) => getComunicados(widget.token)),
          // i is null here (check periodic docs)
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(snapshot.data[index]['titulo']),
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
                        return FormNotification(snapshot.data[index]);
                      }));
                    },
                  ));
                },
              );
            } else {
              final spinkit = SpinKitChasingDots(color: Colors.indigo.shade300);
              return Container(
                  child: Center(
                child: spinkit,
              ));
            }
          }),
    );
  }
}

Future getComunicados(token) async {
  List list;
  Response response =
      await get('http://10.0.2.2:8000/app/apicomunicados/?format=json', headers: {
    'Authorization': 'Token ' + await token
  }); //cambiar direccion ip a la del dispositivo que se corre el  django server en la red local.(haciendo un manage.py runserver 0.0.0.0:8000)
  list = jsonDecode(response.body);
  return list;
}
