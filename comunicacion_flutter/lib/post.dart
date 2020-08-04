import 'package:flutter/material.dart';

import './models.dart';

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
    );
  }
}
