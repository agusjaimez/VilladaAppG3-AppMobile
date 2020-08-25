import 'package:flutter/material.dart';
import 'package:comunicacion/screens/modelPost/models_example.dart';
import 'package:comunicacion/screens/home/form_notifications.dart';

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
        title: Text(post.body),
        trailing: IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              Navigator.push(context, PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation<double> secAnimaiton) {
                return Form_notification();
              }));
            }));
  }
}
