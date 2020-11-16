import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'datos.dart';

Future<EnvF> createEnvF(int alumno, String descripcion, String tipoform, String dias, String fecha, String hora) async {

  SharedPreferences preferences = await SharedPreferences.getInstance();
  final token = preferences.getString('token');
  final http.Response response = await http.post(
    'http://10.0.2.2:8000/app/apiforms/',
    headers: {'Content-Type': 'application/json; charset=utf-8','Authorization': 'Token ' +  token},
    body: jsonEncode(<String, dynamic>{
      'alumno': alumno,
      'descripcion': descripcion,
      'tipo_form': tipoform,
      'dias': dias,
      'fecha': fecha,
      'hora': hora
    }),
  );
  print(jsonDecode(response.body));
  if (response.statusCode == 201) {
    return EnvF.fromJson(jsonDecode(response.body));
  } else {
    print("algo no salio bien y no se que es");
  }
}