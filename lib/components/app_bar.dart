import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  List<Padding> actions;
  AppBarWidget({this.titleAppBar, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleAppBar,
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
}
