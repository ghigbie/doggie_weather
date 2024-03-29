import 'package:flutter/material.dart';

class BackButtonIOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: 50.0,
        color:Color(0xffffffff)
      )
    );
  }
}