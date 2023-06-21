import 'package:flutter/material.dart';

import '../models/forecast_model.dart';

class UpcommingWeatherListTitle extends StatelessWidget {
  const UpcommingWeatherListTitle(
      {super.key,
      required this.forecastDay,
      required this.image,
      required this.temp});
  final Forecastday? forecastDay;
  final String image;
  final String temp;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //todo
      },
      child: ListTile(
        leading: Image.network('https:$image'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Day: ${forecastDay?.date ?? ""}',
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
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 1,
            )
          ],
        ),
        trailing: Text('$temp C',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}
