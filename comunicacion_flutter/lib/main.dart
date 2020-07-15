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

class Principal extends StatelessWidget {
  const Principal({Key key}) : super(key: key);

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
                  'Drawer Header',
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
              new Container(
                //child: Text("hola"),
                color: Colors.black,
                height: 730.0,
                width: 400,
                margin: EdgeInsets.all(1),
                //padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[contenedor()]),
                ),
              ),
              //new Container(color: Colors.black, height: 302.0, width: 400)
            ],
          ),
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
