import 'package:flutter/material.dart';
import 'package:comunicacion/principal.dart';

class WidgetOrigen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: const Text('Its_comunications'),
        backgroundColor: Color(0xff1a237e),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 65),
              its_img,
              SizedBox(height: 25),
              MaterialButton(
                  child: const Text(
                    'Bienvenidos',
                    style: TextStyle(fontSize: 25),
                  ),
                  color: Colors.white,
                  elevation: 6,
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.push(context, PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> adnimation,
                            Animation<double> secAnimation) {
                      return Principal();
                    }));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
var its_img = new Container(
  height: 170,
  width: 170,
  decoration: new BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 3.0,
        spreadRadius: 1.0,
        offset: Offset(
          0.0,
          4.0,
        ),
      ),
    ],
    image: new DecorationImage(
      image: new AssetImage('assets/its.jpg'),
      fit: BoxFit.cover,
    ),
  ),
);
