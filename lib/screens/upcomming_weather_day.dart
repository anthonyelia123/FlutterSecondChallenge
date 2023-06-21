import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/upcomming_weather_provider.dart';
import '../widgets/upcomming_weather_list_title.dart';

class UpcommingWeatherScreen extends StatefulWidget {
  const UpcommingWeatherScreen({super.key});

  @override
  State<UpcommingWeatherScreen> createState() => _UpcommingWeatherScreenState();
}

class _UpcommingWeatherScreenState extends State<UpcommingWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    var upcommingWeatherProvider =
        Provider.of<UpcommingWeatherProvider>(context);

    return Center(
      child: FutureBuilder(
          future: upcommingWeatherProvider.getUpcommingWeather(),
          builder: (context, snapshot) {
            return upcommingWeatherProvider.upcommingWeather != null
                ? ListView.builder(
                    itemCount: upcommingWeatherProvider
                            .upcommingWeather?.forecast?.forecastday?.length ??
                        0,
                    itemBuilder: (BuildContext context, int index) {
                      return UpcommingWeatherListTitle(
                        forecastDay: upcommingWeatherProvider
                            .upcommingWeather?.forecast?.forecastday![index],
                        image: upcommingWeatherProvider
                                .upcommingWeather?.current?.condition?.icon ??
                            "",
                        temp: upcommingWeatherProvider
                                .upcommingWeather?.current?.tempC
                                .toString() ??
                            "",
                      );
                    },
                  )
                : const Center(child: Text('No Data found'));
          }),
    );
  }
}
