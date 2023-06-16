import 'package:flutter/material.dart';
import 'package:second_challenge/api/dio_client.dart';

class ModelProvider with ChangeNotifier {
  final DioClient _dioClient = DioClient();
}
