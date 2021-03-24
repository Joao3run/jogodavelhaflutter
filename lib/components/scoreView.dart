import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogodavelhaflutter/components/score.dart';

class Score extends StatelessWidget {
  final int crossWin;
  final int circleWin;
  final int draw;

  Score({this.crossWin, this.circleWin, this.draw});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ScoreLabel(
              label: 'X',
              score: crossWin,
              color: Color.fromRGBO(255, 0, 0, 1.0),
            ),
            ScoreLabel(
              label: 'O',
              score: circleWin,
              color: Color.fromRGBO(255, 165, 0, 1.0),
            ),
            ScoreLabel(
              label: 'E',
              score: draw,
              color: Color.fromRGBO(106, 90, 205, 1.0),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
