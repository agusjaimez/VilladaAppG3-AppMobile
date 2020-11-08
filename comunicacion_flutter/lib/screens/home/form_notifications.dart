import 'package:flutter/material.dart';

class FormNotification extends StatelessWidget {
  final Map data;
  FormNotification(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: 
      Column(
        children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Stack(
                children:<Widget>[
                  Container(
                    width: double.infinity,
                    height: 557.2,
                    color: Colors.white
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.indigo.shade600, Colors.indigo.shade300]
                      )
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[                       
                          Text(
                            data['titulo'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: 'Comfortaa'),
                          ),
                        ]
                      )
                    )
                  ),
                  Positioned.fill(
                      top:120,
                      bottom: 330,
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                          child: Column(
                            children: [
                                Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Directivo: "+data['directivo']['first_name'] +" "+data['directivo']['last_name'] .toString(), style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),),
                                  // Text(
                                  //   "Juan Pablo Canepa",style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                                  // ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data['fecha'].toString(),
                                    style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                                  ),
                                  SizedBox(width: 10),
                                  Text("Cursos: "+ data['curso'].join(", ").toString(),
                                    style: TextStyle(fontSize: 17,fontStyle: FontStyle.italic)) ,
                                ],
                              )
                            ]  
                          )
                        )
                      ),
                  ),
                  Positioned(
                    top: 280,
                    left: 20,
                    child: Container(
                      width: 330,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notificacion: ",
                          style: TextStyle(
                            color: Colors.indigoAccent,
                            fontSize: 28,
                          ),),
                        SizedBox(height: 10),
                        Text(
                          data['mensaje'],
                          style: TextStyle(
                            fontSize: 22.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            letterSpacing: 2.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 25,     
                  child: Container(
                    width: 150,
                    child: RaisedButton(
                      onPressed: (){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)
                      ),
                      elevation: 5.0,
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Colors.redAccent,Colors.pinkAccent]
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text("No Acepto",
                          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight:FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 195,  
                  child: Container(
                    width: 150,
                    child: RaisedButton(
                      onPressed: (){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)
                      ),
                      elevation: 5.0,
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Colors.lightGreen.shade300,Colors.green.shade400]
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text("Acepto",
                          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight:FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                  )),
              ]
            ),
          ],
        ),
      ),]
    ),
  );
  }
} 
