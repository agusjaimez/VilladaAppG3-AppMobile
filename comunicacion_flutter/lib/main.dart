import 'package:comunicacion/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Its_comunications',
      home: new WidgetOrigen(),
    );
  }
}

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

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 120.0,
              width: 310,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: Text(
                  'Opciones',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ExpansionTile(
              title: Text('Crear Formularios para Alumno'),
              children: <Widget>[
                new ListTile(
                  title: const Text('Formulario F1'),
                  subtitle: Text('Justificar las Faltas'),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => F1()));
                  },
                ),
                new ListTile(
                  title: const Text('Formulario F2'),
                  subtitle: Text('Retiro por Motivos Escolares'),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => F2()));
                  },
                ),
                new ListTile(
                  title: const Text('Formulario F3'),
                  subtitle: Text('Retiro Anticipado'),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => F3()));
                  },
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: Text('Cerrar Sesion'),
                  onTap: () {
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                ),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 5.2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 14.0, left: 9.0),
                        width: 325,
                        height: 95,
                        decoration: BoxDecoration(
                          color: Color(0xffd6d6d6),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 60.0),
                              child: Text(
                                'SALIDA A LOS GIGANTES',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              padding: EdgeInsets.only(left: 60.0),
                              child: Text(
                                'Autorización',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              padding: EdgeInsets.only(left: 60.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Atte: Prof:',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  SizedBox(width: 2.0),
                                  Text(
                                    'Ruben Arce',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

contenedor() {
  for (var i = 0; i <= 2; i++) {
    return new Container(
      margin: EdgeInsets.all(1),
      //padding: EdgeInsets.all(74),
      child: Text("hola"),
      color: Colors.amber,
      height: 20.0,
      width: 380,
    );
  }
}
