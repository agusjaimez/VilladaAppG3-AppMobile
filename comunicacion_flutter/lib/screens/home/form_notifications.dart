import 'package:flutter/material.dart';

class Form_notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Titulo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Sub-Titulo',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                  Container(
                    child: Text(
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  '
                      'palabras palabras palabras palabras palabras palabras palabras  ',
                      softWrap: true,
                    ),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new RaisedButton(
                          color: Colors.amber,
                          textColor: Colors.black26,
                          child: Text("Acepto"),
                          onPressed: () {
                            return true;
                          }),
                      new RaisedButton(
                          color: Colors.amber,
                          textColor: Colors.black26,
                          child: Text("No Quiero"),
                          onPressed: () {
                            return false;
                          })
                    ],
                  ))
                ],
              ),
            ),
            /*3*/
          ],
        ),
      ),
    );
  }
}
