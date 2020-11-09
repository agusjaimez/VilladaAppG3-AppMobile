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
      body: SafeArea(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            
            children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width ,
                    child: ListView(
                    children: <Widget>[  
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
                   
                    Container(
                     height: MediaQuery.of(context).size.height,
                     
                      child: Column(
                      
                      children: [
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
                        ),
                        
                      ],
                    ),
                    
                  ),
                  
                 
                  ]
                    )
                  )
                  
                  
              ]
            
          
        ),
      ),
      
    ),
      );

  }
} 
