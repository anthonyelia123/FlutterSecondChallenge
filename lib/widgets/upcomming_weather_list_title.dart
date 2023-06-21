import 'package:flutter/material.dart';

import '../models/forecast_model.dart';

class UpcommingWeatherListTitle extends StatelessWidget {
  const UpcommingWeatherListTitle({super.key, required this.forecastDay});
  final Forecastday? forecastDay;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //todo
      },
      child: ListTile(
        // leading: Image.network(forecastDay.day?.condition?.icon ?? ''),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(forecastDay?.date ?? "",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            const SizedBox(
              height: 10,
            ),
            Text('Sunrise: ${forecastDay?.astro?.sunrise}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            const SizedBox(
              height: 10,
            ),
            Text('Sunset: ${forecastDay?.astro?.sunset}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
          ],
        ),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }
}
