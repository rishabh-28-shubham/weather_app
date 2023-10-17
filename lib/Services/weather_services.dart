import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;

class Weather_Services {
  static const BASE_URL = "https://home.openweathermap.org/api_keys";
  final String api_keys;

  Weather_Services(this.api_keys);

  Future<Weather> Know_Weather(String City_Name) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?=City_Name&appid=$api_keys&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Faild to load Weather Data");
    }
  }

  Future<String> Know_Current_City() async {
    //asking for the user permission for location
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //fetching the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    //converting location into a list of placemark objects
    // this means marking places on which bases , here i have used latitude and longitude
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //extract the city name from the first placemark
    String? city = placemark[0].locality;

    return city ?? "";
  }
}
