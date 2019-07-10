import 'package:flutter/material.dart';
import 'package:doggie_weather/services/weather.dart';
import 'package:doggie_weather/screens/city_screen.dart';
import 'package:doggie_weather/utilities/constants.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  
  WeatherModel weatherModel = WeatherModel();
  int temperature;
  String cityName;
  String weatherMessage;
  String selectedImage = 'cold_dog';

  void updateUI(dynamic weatherData){
    setState((){
      if(weatherData == null){
        temperature = 0;
        cityName = 'Not available';
        weatherMessage = '';
        selectedImage = 'cold_dog';
      }

      temperature = weatherData['main']['temp'].toInt();
      int condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherMessage = weatherModel.getMessage(temperature);
      selectedImage = weatherModel.getDoggiePicture(condition);
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
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
                      onPressed: () async{
                        var weatherData = await weatherModel.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0
                      )
                    ),
                    FlatButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context){
                              return CityScreen();
                            }),
                        );
                          if(typedName != null){
                            var weatherData = await weatherModel.getCityWeather(typedName);
                            updateUI(weatherData);
                          }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0
                      )
                    )
                  ]
                ),
              Padding(
                padding:EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                       style: kTempTextStyle,
                    )
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                )
              )
            ],
          )
        ),
      )
      ),
    );
  }
}