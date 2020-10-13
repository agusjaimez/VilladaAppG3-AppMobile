import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemSideBar extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  const ItemSideBar({Key key, this.icon, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: onTap,
      child: Padding(
        
        padding: const EdgeInsets.all(16),
        child: Row(
          
          children:<Widget>[
              
              GestureDetector(
              
              child: Icon(
                
                icon,
                color: Colors.blue.shade800,
                size: 30,
                
              ),
            ),
            
            
            SizedBox(width: 30),
            
              
              Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: Colors.white),
            ),
            
          ],
        ),
      ),
    );
  }
}
// ExpansionTile(
//             title: Text('Crear Formularios para Alumno'),
//             children: <Widget>[
//               new ListTile(
//                 title: const Text('Formulario F1'),
//                 subtitle: Text('Justificar las Faltas'),
//                 onTap: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => F1()));
//                 },
//               ),
//               new ListTile(
//                 title: const Text('Formulario F2'),
//                 subtitle: Text('Retiro por Motivos Escolares'),
//                 onTap: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => F2()));
//                 },
//               ),
//               new ListTile(
//                 title: const Text('Formulario F3'),
//                 subtitle: Text('Retiro Anticipado'),
//                 onTap: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => F3()));
//                 },
//               ),
//             ],
//           ),
