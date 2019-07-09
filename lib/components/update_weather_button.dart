import 'package:flutter/material.dart';
import 'package:doggie_weather/services/weather.dart';

class UpdateWeatherButton extends StatelessWidget {

  UpdateWeatherButton({this.weatherModel});
  WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async{
      var weatherData = await weatherModel.getLocationWeather();
      updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0
                      )
                    ),
}