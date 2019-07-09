import 'package:flutter/material.dart';
import 'package:doggie_weather/components/back_button_ios.dart';
import 'package:doggie_weather/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage('images/loading_dog.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: BackButtonIOS(),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child:TextField(
                  style:TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value){
                    cityName = value;
                  }
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather', 
                  //style: I may want to add a style here
                )
              )
            ],
          )
        )
      )
    );
  }
}