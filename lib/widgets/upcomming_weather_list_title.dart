import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/weather_response_model.dart';

class UpcommingWeatherListTitle extends StatelessWidget {
  const UpcommingWeatherListTitle({super.key, required this.upcommingWeather});
  final WeatherResponseModel upcommingWeather;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //todo
      },
      child: ListTile(
        leading: Image.network(upcommingWeather.current?.condition?.icon ?? ''),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Day name, Day',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            const SizedBox(
              height: 10,
            ),
            Text('Sunrise',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            const SizedBox(
              height: 10,
            ),
            Text('sunset',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
          ],
        ),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }
}
