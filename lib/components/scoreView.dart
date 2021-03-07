import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogodavelhaflutter/components/score.dart';

SizedBox score({int crossWin, int circleWin, int draw}) {
  return SizedBox(
    height: 100.0,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          scoreLabel(
            label: 'X',
            score: crossWin,
            color: Color.fromRGBO(255, 0, 0, 1.0),
          ),
          scoreLabel(
            label: 'O',
            score: circleWin,
            color: Color.fromRGBO(255, 165, 0, 1.0),
          ),
          scoreLabel(
            label: 'E',
            score: draw,
            color: Color.fromRGBO(106, 90, 205, 1.0),
          ),
        ],
      ),
    ),
  );
}
