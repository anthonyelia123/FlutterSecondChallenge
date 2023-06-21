import 'package:flutter/cupertino.dart';
import 'package:second_challenge/models/forecast_model.dart';

import '../api/dio_client.dart';

class UpcommingWeatherProvider with ChangeNotifier {
  final DioClient _dioClient = DioClient();
  ForecastResponseModel? upcommingWeather;

  Future<void> getUpcommingWeather() async {
    upcommingWeather = await _dioClient.getUpcommingWeather();
    notifyListeners();
  }
}
