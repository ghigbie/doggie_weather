import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  
  int temperature;
  String cityName;
  String weatherMessage;
  String selectedImage = 'cold_dog';

  void updateUI(dynamic weatherData){
    setState((){
      if(!weatherData){
        temperature = 0;
        cityName = 'Not available';
        weatherMessage = '';
        selectedImage = 'cold_dog';
      }

      //need to write updates for weather here
    });
  }

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration:BoxDecoration(
            image:DecorationImage(
              image: AssetImage('images/$selectedImage.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), 
                BlendMode.dstATop
              ),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {

                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0
                      )
                    ),
                    FlatButton(
                      onPressed: (){

                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0
                      )
                    )
                  ]
                )

            ],
          )
        ),
      )
    );
  }
}