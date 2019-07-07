import 'package:flutter/material.dart';
import 'package:doggie_weather/screens/loading_screen.dart';
import 'package:doggie_weather/utilities/constants.dart';


void main() => runApp(DoggieWeather());

class DoggieWeather extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}