// import 'dart:ffi';

class Weather {
  final String City_Name;
  final double Temperature;
  final String Main_Condition;

  //calling a constructor
  Weather({
    required this.City_Name,
    required this.Temperature,
    required this.Main_Condition,
  });

//a factory constructor which returns the prexisting instance by reusing it
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        City_Name: json['name'],
        Temperature: json['main']['temp'].todouble(),
        Main_Condition: json['weather'][0]['main']
      );
  }
}
