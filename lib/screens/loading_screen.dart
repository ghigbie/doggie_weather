import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:doggie_weather/services/weather.dart';
import 'package:doggie_weather/screens/location_screen.dart';
import 'package:doggie_weather/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }),
    );
  }


  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/loading_dog.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.9),
                    BlendMode.dstATop
                    ),
                  )
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SpinKitPulse(
                    color: Colors.grey[350],
                    size: 130.0
                  ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'We are listeing for the weather in your area...',
                    style: kLoadingPageTextStyle,
                    textAlign: TextAlign.center,
                    ),
                )
              ],
            ),
        )
      ),
    );
  }
}