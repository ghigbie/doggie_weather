import 'package:flutter/material.dart';

const kAppTitle = 'Doggie Weather';

const kLoadingPageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 24.0,
  color: Color(0xff242424),
);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    ),
                  );

const kOpenWeatherBaseURL = 'https://api.openweathermap.org/data/2.5/weather';