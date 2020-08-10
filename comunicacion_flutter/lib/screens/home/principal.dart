import 'package:comunicacion/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:comunicacion/utils/Slide.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'custom_dropdown.dart';
import 'notificacionWidget.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  bool enabled = false;

  double _scaleFactor = 2.0;

  _onPressedW(BuildContext context) {
    print("CLICK");
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                InkWell(
                    child: BouncingWidget(
                  scaleFactor: _scaleFactor,
                  onPressed: () {
                    _onPressedW(context);
                    Route route = SlideDuration(widget: Notificacion());
                    Navigator.push(context, route);
                    setState(() {
                      enabled = true;
                    });
                  },
                  child: Card(
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
                              color: (enabled
                                  ? Color(0xffd6d6d6)
                                  : Color(0xff0277bd)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 60.0),
                                    child: Text(
                                      'SALIDA A LOS GIGANTES',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontFamily: 'Comfortaa',
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
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                        ),
                                        SizedBox(width: 2.0),
                                        Text('Ruben Arce',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black
                                                    .withOpacity(0.5))),
                                      ],
                                    ),
                                  ),
                                ])),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
