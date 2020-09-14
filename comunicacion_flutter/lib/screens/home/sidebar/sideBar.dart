import 'dart:async';
import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:comunicacion/screens/home/sidebar/itemSideBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenController;
  Stream<bool> isSideBarOpenStream;
  StreamSink<bool> isSideBarOpenSink;

  final _animationDuration = const Duration(milliseconds: 500);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    initUser();
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenController = PublishSubject<bool>();
    isSideBarOpenStream = isSideBarOpenController.stream;
    isSideBarOpenSink = isSideBarOpenController.sink;
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  void dispose() {
    _animationController.dispose();
    isSideBarOpenController.close();
    isSideBarOpenSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAniamtionCompleted = animationStatus == AnimationStatus.completed;

    if (isAniamtionCompleted) {
      isSideBarOpenSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenSink.add(true);
      _animationController.forward();
    }
  }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (user != null) {
      return StreamBuilder<bool>(
        initialData: false,
        stream: isSideBarOpenStream,
        builder: (context, isSideBarOpenedAsync) {
          return AnimatedPositioned(
          
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
            right: isSideBarOpenedAsync.data ? 0 : screenWidth - 40,
            
            child:SafeArea(
              
            child: Row(
              
              
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                          Colors.indigo.shade300,
                          Colors.blue.shade700
                        ])),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        ListTile(
                          title: Text("${user.displayName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              )),
                          subtitle: Text(
                            "${user.email}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue.shade800,
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.4),
                          indent: 32,
                          endIndent: 32,
                        ),
                        new ListTile(
                        leading: Icon(Icons.home, color: Colors.blue.shade800),
                        title: new Text('Home',
                                        style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                        color: Colors.white
                                        ),
                                        ),
                        
                        onTap: () {
                          onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.PrincipalPageEvent);
                        },
                        ),

                       
                        ExpansionTile(
                          title: Text(
                            'Formularios',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          children: <Widget>[
                            
                            new ListTile(
                        leading: Icon(Icons.assignment, color: Colors.blue.shade800),
                        title: new Text('Justificar Faltas (F1)',
                                        style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                        color: Colors.white
                                        ),
                                        ),
                        
                        onTap: () {
                          onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                    .add(NavigationEvents.FormularioF1Event);
                        },
                        ),
                        new ListTile(
                        leading: Icon(Icons.assignment, color: Colors.blue.shade800),
                        title: new Text('Retiro imprevisto (F2)',
                                        style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                        color: Colors.white
                                        ),
                                        ),
                        
                        onTap: () {
                          onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                    .add(NavigationEvents.FormularioF2Event);
                        },
                        ),
                        new ListTile(
                        leading: Icon(Icons.assignment, color: Colors.blue.shade800),
                        title: new Text('Retiro Anticipado (F3)',
                                        style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                        color: Colors.white
                                        ),
                                        ),
                        
                        onTap: () {
                          onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                    .add(NavigationEvents.FormularioF3Event);
                        },
                        ),
                        ],
                        ),
                        
                        ItemSideBar(
                          
                          onTap: () {
                            
                          },
                          icon: Icons.face,
                          title: 'Informacion Alumno',
                          
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: ListTile(
                                leading: Icon(Icons.power_settings_new,
                                    color: Colors.white),
                                title: Text(
                                  'Cerrar Sesion',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                onTap: () async {
                                  await _auth.signOut();
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.7),
                  
                  child: GestureDetector(
                    
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      
                      clipper: CustomItem(),
                      child: Container(
                        
                          width: 35,
                          height: 110,
                          color: Colors.indigo.shade300,
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                            
                            progress: _animationController.view,
                            icon: AnimatedIcons.menu_close,
                            color: Color(0xFF1BB5FD),
                            size: 25,
                          )),
                    ),
                  ),
                ),
              ],
            ),

            ),
            
          );
        },
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}

class CustomItem extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
