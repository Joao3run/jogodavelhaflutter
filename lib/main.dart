import 'package:flutter/material.dart';
import 'pages/TicTacToe.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Velha',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TicTacToe(),
    );
  }
}

void main() => runApp(MyApp());
