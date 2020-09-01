import 'package:flutter/material.dart';
import 'package:comunicacion/compartido/constant.dart';
import 'package:comunicacion/compartido/its_Img.dart';
import 'package:comunicacion/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final Auth _auth = Auth();

  final TextEditingController _contra = TextEditingController();
  final TextEditingController _confirmContra = TextEditingController();

  bool loading = false;

  String email = '';
  String password = '';
  String name = '';
  String error = '';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
          title: const Text('Registrarse'),
          backgroundColor: Color(0xff1a237e),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ))
          ]),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 25),
                its_img,
                SizedBox(height: 20),
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? 'Ingrese un Nombre adecuado' : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                  decoration: textInputDecoration.copyWith(hintText: 'Nombre'),
                ),
                SizedBox(height: 35),
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? 'Ingrese un email correcto' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _contra,
                  validator: (val) => val.length < 6
                      ? 'Ingrese una contraseña mas segura'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Contraseña'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _confirmContra,
                  validator: (val) {
                    if (val.isEmpty)
                      return 'Ingrese su contraseña otravez para confirmarla';
                    if (val != _contra.text) {
                      return 'Su contraseña no coincide';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Confirme su Contraseña'),
                ),
                SizedBox(height: 20),
                RaisedButton(
                    color: Colors.blue[400],
                    child: Text(
                      'Registrarse',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.registerEmailPassword(
                            email, password, name);

                        if (this.mounted) {
                          setState(() => loading = true);
                        }
                        if (result == null) {
                          setState(() {
                            error = 'Mail o Contraseña no son correctos';
                            loading = false;
                          });
                        }
                      }
                    }),
                SizedBox(height: 10),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
