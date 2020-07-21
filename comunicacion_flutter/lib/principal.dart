import 'package:comunicacion/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  bool selected = true;

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
              Stack(
                children: [
                  Card(
                    elevation: 5.2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 14.0, left: 9.0),
                          width: 320,
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
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 30.0, left: 5),
                      child: ClipOval(
                        child: Material(
                          color: Colors.red,
                          child: InkWell(
                            splashColor: Colors.blue,
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Icon(Icons.check)),
                            onTap: () {},
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
