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
  final _weatherServices = Weather_Services(api_keys);
  //a weather object
  Weather? _weather;

//fetch "weather"
  _fetchWeather() async {
    //identifing current city
    String City_Name = await _weatherServices.Know_Current_City();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
