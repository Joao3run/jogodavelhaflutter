import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget actionIcon({IconData icon, Function onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
    ),
  );
}
