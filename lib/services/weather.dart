import 'package:doggie_weather/services/location.dart';
import 'networking.dart';
import 'package:doggie_weather/utilities/constants.dart';
import 'package:doggie_weather/utilities/hidden_constants.dart';

class WeatherModel {

  Future <dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(url: 
    '$kOpenWeatherBaseURL?q=$cityName&appid=$kAPIKey&units=imperial');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future <dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(url: 
    '$kOpenWeatherBaseURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kAPIKey&units=imperial');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  String getDoggiePicture(int condition){
    if (condition < 300){
      return 'slightly sad dog';
    } else if (condition < 400) {
      return 'more sad dog';
    } else if (condition < 600) {
      return 'very sad dog';
    } else if (condition < 700) {
      return 'dog in sweater';
    } else if (condition < 800) {
      return 'dog in t shirt';
    } else if (condition == 800) {
      return 'sunglass_dog';
    } else if (condition <= 804) {
      return 'happy dog';
    } else {
      return 'neutral dog';
    }
  }

  String getMessage(int temp){
    if (temp >= 77 ) {
      return 'It\'s time to give your doggie ice cream!';
    } else if (temp >= 63) {
      return 'Take off your doggies\'s sweater';
    } else if (temp < 50) {
      return 'Put sweater or jacket on your doggie. It\'s cold!';
    } else {
      return 'Bring a doggie 🧥 just in case';
    }
  }
}