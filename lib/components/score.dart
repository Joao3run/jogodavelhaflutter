import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Padding scoreLabel({String label, int score, Color color}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Text(
          '${label}',
          style: TextStyle(
            fontSize: 30.0,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          '${score}',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        )
      ],
    ),
  );
}
