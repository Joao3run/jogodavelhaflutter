import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jogodavelhaflutter/components/action_icon.dart';
import 'package:jogodavelhaflutter/components/app_bar.dart';
import 'package:jogodavelhaflutter/components/bottom_label.dart';
import 'package:jogodavelhaflutter/components/scoreView.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  int crossWin = 0;
  int circleWin = 0;
  int draw = 0;
  List<int> gameState;
  bool isCross = true;
  bool gameEnd = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = [
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
      ];
    });
  }

  List<dynamic> winningSequences = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  String getValue(int value) {
    switch (value) {
      case (0):
        return 'O';
        break;
      case (1):
        return 'X';
        break;
      case (2):
        return '';
        break;
    }
  }

  Color getColor(int value) {
    switch (value) {
      case (1):
        return Colors.red;
        break;
      case (2):
        return Colors.white;
        break;
      case (0):
        return Colors.orange;
        break;
    }
  }

  newGame() {
    resetGame();
    setState(() {
      crossWin = 0;
      circleWin = 0;
      draw = 0;
    });
  }

  markPoints(int mark) {
    switch (mark) {
      case (1):
        setState(() {
          crossWin += 1;
        });
        break;
      case (0):
        setState(() {
          circleWin += 1;
        });
        break;
      case (2):
        setState(() {
          draw += 1;
        });
        break;
    }
  }

  playGame(int index) {
    if (gameState[index] == 2) {
      setState(() {
        if (isCross) {
          gameState[index] = 0;
        } else {
          gameState[index] = 1;
        }
        isCross = !isCross;
        dynamic winnerSeqIndex =
            checkWinningSequences(gameState[index], isCross);
        if (winnerSeqIndex != -1) {
          showWiner(winnerSeqIndex);
          markPoints(winnerSeqIndex);
        } else if (!gameState.contains(2)) {
          showWiner(2);
          markPoints(2);
        }
      });
    }
  }

  dynamic checkWinningSequences(int symbol, bool isCross) {
    for (var sequence in winningSequences) {
      for (var sequenceIndex in sequence) {
        if (gameState[sequence[0]] == symbol &&
            gameState[sequence[1]] == symbol &&
            gameState[sequence[2]] == symbol) {
          return symbol;
        }
      }
    }
    return -1;
  }

  resetGame() {
    Timer(
      Duration(seconds: 5),
      () {
        setState(
          () {
            gameState = [
              2,
              2,
              2,
              2,
              2,
              2,
              2,
              2,
              2,
            ];
            gameEnd = false;
          },
        );
      },
    );
  }

  showWiner(int winner) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Center(
          child: Text(
            '${winner == 2 ? 'Empate!' : winner == 0 ? 'O jogador O ganhou!' : 'O Jogador X ganhou!'}',
          ),
        ),
      ),
    );
    resetGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Jogo da Velha',
        actions: [
          actionIcon(
              icon: Icons.refresh,
              onPressed: () {
                newGame();
              }),
        ],
      ),
      body: Container(
        color: Color.fromRGBO(240, 240, 240, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
              ),
              child: score(
                crossWin: crossWin,
                circleWin: circleWin,
                draw: draw,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(
                  20,
                  100,
                  20,
                  20,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: gameState.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: FlatButton(
                    color: getColor(gameState[i]),
                    onPressed: () => playGame(i),
                    child: Text(
                      getValue(gameState[i]),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                    shape: Border.all(
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.2,
                      ),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
            bottomLabel(isCross),
          ],
        ),
      ),
    );
  }
}
