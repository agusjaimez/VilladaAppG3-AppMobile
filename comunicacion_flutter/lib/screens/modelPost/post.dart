import 'package:flutter/material.dart';
import 'package:comunicacion/screens/modelPost/models_example.dart';
import 'package:comunicacion/screens/home/form_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post extends StatelessWidget {
  final PostModel post;

  const Post({
    Key key,
    @required this.post,
  })  : assert(post != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SizedBox(
        width: double.infinity,
        child: Align(
          alignment: Alignment(-0.5, 0),
          child: Text(post.body, textAlign: TextAlign.left),
        ),
      ),
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
    );
  }
}
