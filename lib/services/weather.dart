import 'package:doggie_weather/services/location.dart';
import 'networking.dart';
import 'package:doggie_weather/utilities/constants.dart';
import 'package:doggie_weather/utilities/hidden_constants.dart';

class WeatherModel {
  Future <dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
  }
}