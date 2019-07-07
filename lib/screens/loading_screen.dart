import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  void getLocation() async {

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/loading_dog.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.7),
            BlendMode.dstATop
            ),
          )
        ),
      child: Container(
        margin:EdgeInsets.only(bottom: 250.0),
        child: Column(
          children: <Widget>[
            SpinKitPulse(
                color: Colors.white,
                size: 90.0
              ),
            Text('We are listeing for the weather in your area...')
          ],
        ),
      )
      );
  }
}