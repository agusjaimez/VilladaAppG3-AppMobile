
import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:comunicacion/screens/modelPost/posts.dart';
import 'package:flutter/material.dart';
// import 'package:comunicacion/utils/Slide.dart';
// import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:comunicacion/screens/home/principal_data.dart';


class Principal extends StatefulWidget with NavigationStates {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  bool enabled = false;

  List<PrincipalData> _datas = List<PrincipalData>();

  Future<List<PrincipalData>> fetchPrincipalDatas() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);

    var datas = List<PrincipalData>();

    if (response.statusCode == 200){
      var data = json.decode(response.body);
      for(var title in data){
        datas.add(PrincipalData.fromJson(title));
      }
    }
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    fetchPrincipalDatas().then((value){
      setState(() {
        _datas.addAll(value);
      });
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Center(child: new Text("Comunicados", textAlign: TextAlign.center)),
        backgroundColor: Colors.indigo.shade300,
       ),

      body: ListView.builder(
        itemBuilder: (context, index){
          var right = TextAlign.right;
          return Card(
              child: ListTile(
                   title:SizedBox(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment(-0.5, 0),
                        child: Text(_datas[index].title, textAlign: TextAlign.left),
                      ),
                       
                    ), 
                  trailing: IconButton(   
                      icon: Icon(Icons.arrow_right),
                      ),
              )
              
          
          );
          
        }, itemCount: _datas.length,
        
          
          
      )
    );
  }
}
