import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              
            ],
          )
        ),
      )
    );
  }
}