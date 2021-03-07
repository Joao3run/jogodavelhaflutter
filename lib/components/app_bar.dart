import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBar({String title, List<Padding> actions}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Colors.red, Colors.blue, Colors.yellow],
        ),
      ),
    ),
    actions: actions,
  );
}
