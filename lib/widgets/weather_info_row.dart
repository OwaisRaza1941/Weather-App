import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_info_icon.dart';

class WeatherInfoRow extends StatelessWidget {
  const WeatherInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        WeatherInfoItem(
          icon: 'assets/icons/humidity_icon.png',
          title: 'HUMIDITY',
          value: '56%',
        ),
        WeatherInfoItem(
          icon: 'assets/icons/wind_icon.png',
          title: 'WIND',
          value: '4.6km/h',
        ),
        WeatherInfoItem(
          icon: 'assets/icons/feels_like_icon.png',
          title: 'Feels Like',
          value: '36°',
        ),
      ],
    );
  }
}
