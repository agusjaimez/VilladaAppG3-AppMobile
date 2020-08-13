import 'package:comunicacion/screens/modelPost/posts.dart';
import 'package:comunicacion/services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:comunicacion/utils/Slide.dart';
// import 'package:bouncing_widget/bouncing_widget.dart';
import 'custom_dropdown.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  bool enabled = false;

  // double _scaleFactor = 2.0;

  // _onPressedW(BuildContext context) {
  //   print("CLICK");
  // }

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SideBar Prueba')),
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
            Text('nombre'),
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
                    onTap: () async {
                      await _auth.signOut();
                    }),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
      body: Posts(),
    );
  }
}
