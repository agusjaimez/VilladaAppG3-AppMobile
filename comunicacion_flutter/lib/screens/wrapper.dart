import 'package:comunicacion/screens/authenticate/autenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comunicacion/screens/home/principal.dart';
import 'package:comunicacion/utils/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Principal();
    }
  }
}
