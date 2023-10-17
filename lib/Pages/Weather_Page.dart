import 'package:flutter/material.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/model/weather_model.dart';

class Weather_Page extends StatefulWidget {
  const Weather_Page({super.key});

  @override
  State<Weather_Page> createState() => _Weather_PageState();
}

class _Weather_PageState extends State<Weather_Page> {
//api key
  final _weatherServices = Weather_Services('f680d549452175ac014bb0351712aa9d');
  //a weather object
  Weather? _weather;

//fetch "weather"
  _fetchWeather() async {
    try {
      // Identifying current city
      String City_Name = await _weatherServices.Know_Current_City();

      // Get weather for the identified city
      final weather = await _weatherServices.Know_Weather(City_Name);

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

//init state
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather?.City_Name?? "Loading city..."
            ),
            Text(
              '${_weather?.Temperature}°C'
            )
          ],
        ),
      ),
    );
  }
}
