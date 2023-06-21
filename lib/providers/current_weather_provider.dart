import 'package:flutter/material.dart';
import 'package:second_challenge/api/dio_client.dart';
import 'package:second_challenge/models/weather_response_model.dart';

class CurrentWeatherProvider with ChangeNotifier {
  final DioClient _dioClient = DioClient();
  WeatherResponseModel? currentWeather;

  Future<void> getCurrentWeather() async {
    currentWeather = await _dioClient.getCurrentWeather();
    notifyListeners();
  }
}
