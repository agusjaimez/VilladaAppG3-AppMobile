import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:comunicacion/screens/modelPost/posts.dart';
import 'package:flutter/material.dart';
// import 'package:comunicacion/utils/Slide.dart';
// import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:comunicacion/screens/home/principal_data.dart';
import 'package:comunicacion/screens/home/form_notifications.dart';

class Principal extends StatefulWidget with NavigationStates {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  bool enabled = false;

  List<PrincipalData> _datas = List<PrincipalData>();

  Future<List<PrincipalData>> fetchPrincipalDatas() async {
    var url = 'https://jsonplaceholder.typicode.com/comments';
    var response = await http.get(url);

    var datas = List<PrincipalData>();

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (var title in data) {
        datas.add(PrincipalData.fromJson(title));
      }
    }
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    fetchPrincipalDatas().then((value) {
      setState(() {
        _datas.addAll(value);
      });
    });
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: new Center(
              child: new Text("Comunicados", textAlign: TextAlign.center)),
          backgroundColor: Colors.indigo.shade300,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              title: SizedBox(
                height: 60,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(_datas[index].title),
                ),
              ),
              leading: SizedBox(width: 5),
              trailing: IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {},
              ),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                        Animation<double> secAnimaiton) {
                  return FormNotification();
                }));
              },
            ));
          },
          itemCount: _datas.length,
        ));
  }
}
