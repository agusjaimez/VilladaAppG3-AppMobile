import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
var its_img = new Container(
  height: 170,
  width: 170,
  decoration: new BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 3.0,
        spreadRadius: 1.0,
        offset: Offset(
          0.0,
          4.0,
        ),
      ),
    ],
    image: new DecorationImage(
      image: new AssetImage('assets/its.jpg'),
      fit: BoxFit.cover,
    ),
  ),
);
