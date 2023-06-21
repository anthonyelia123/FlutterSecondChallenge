import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/current_weather_provider.dart';

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var currentWeatherProvider = Provider.of<CurrentWeatherProvider>(context);

    return Center(
      child: FutureBuilder(
          future: currentWeatherProvider.getCurrentWeather(),
          builder: (context, snapshot) {
            return currentWeatherProvider.currentWeather != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(currentWeatherProvider
                              .currentWeather?.current?.condition?.icon ??
                          ""),
                      const Text(
                        'Daily',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${currentWeatherProvider.currentWeather?.current?.tempC} C',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Humidity ${currentWeatherProvider.currentWeather?.current?.humidity ?? ''}rh, Cloud ${currentWeatherProvider.currentWeather?.current?.cloud ?? ''}%, Wind ${currentWeatherProvider.currentWeather?.current?.windMph ?? ''}mph'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(border: Border.all()),
                        width: double.infinity,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Location',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'region: ${currentWeatherProvider.currentWeather?.location?.region}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'country: ${currentWeatherProvider.currentWeather?.location?.country}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'timezone: ${currentWeatherProvider.currentWeather?.location?.tzId}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'last updtae: ${currentWeatherProvider.currentWeather?.current?.lastUpdated}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ]),
                      )
                    ],
                  )
                : const Center(child: Text('No Data found'));
          }),
    );
  }
}
