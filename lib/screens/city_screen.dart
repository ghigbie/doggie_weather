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
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
                color: Colors.grey[300],
                textColor: Colors.grey[800],
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      right: 40.0,
                      left: 40.0
                    ),
                    child: Text(
                      'Get Weather', 
                      style: kButtonTextStyle,
                    ),
                  ),
                )
             )
            ],
          )
        )
      )
    );
  }
}