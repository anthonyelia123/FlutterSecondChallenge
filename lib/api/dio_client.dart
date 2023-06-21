import 'package:dio/dio.dart';
import 'package:second_challenge/models/weather_response_model.dart';

import '../models/forecast_model.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = "https://api.weatherapi.com/v1";

  Future<WeatherResponseModel> getCurrentWeather() async {
    Response data = await _dio.get(
        '$_baseUrl/current.json?key=1689a8894da14b3db2160823232106&q=34.02139053920694,35.647088393446026');
    dynamic jsonData = data.data;

    WeatherResponseModel weatherResponseModel =
        WeatherResponseModel.fromJson(jsonData);

    return weatherResponseModel;
  }

  Future<Forecast> getUpcommingWeather() async {
    Response data = await _dio.get(
        '$_baseUrl/forecast.json?key=1689a8894da14b3db2160823232106&q=34.02139053920694,35.647088393446026&days=14');
    dynamic jsonData = data.data;

    Forecast weatherResponseModel = Forecast.fromJson(jsonData);
    return weatherResponseModel;
  }
}
