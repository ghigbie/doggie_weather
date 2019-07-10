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
    print(weatherData);
    return weatherData;
  }


  String getDoggiePicture(int condition){
    if (condition < 300){
      return 'rain_coat_dog';
    } else if (condition < 400) {
      return 'drizzle_dog';
    } else if (condition < 600) {
      return 'heavy_rain_dog';
    } else if (condition < 612){ //light snow
      return 'cold_dog_blanket';
    } else if (condition < 700) {
      return 'dog_in_snow';
    } else if (condition < 741 ){
      return 'foggy_dog';
    } else if (condition < 800) {
      return 'stay_inside_dog';
    } else if (condition < 801 ){
      return 'sunglass_dog';
    } else if (condition <= 804) {
      return 'cloudy_dog2';
    } else {
      return 'happy_dog';
    }
  }

  String getMessage(int temp){
    if (temp > 77 ) {
      return 'It\'s time to give your doggie ice cream';
    } else if (temp > 62) {
      return 'Take off your doggies\'s sweater';
    } else if (temp < 50) {
      return 'It\'s cold! Put sweater or jacket on your doggie';
    } else {
      return 'Bring a doggie 🧥 just in case';
    }
  }
}