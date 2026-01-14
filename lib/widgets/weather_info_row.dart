import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_info_icon.dart';

class WeatherInfoRow extends StatelessWidget {
  final num humidity;
  final num windSpeed;
  final num feelsLike;

  const WeatherInfoRow({
    super.key,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: WeatherInfoItem(
            icon: 'assets/icons/humidity_icon.png',
            title: 'HUMIDITY',
            value: '$humidity%',
          ),
        ),
        Expanded(
          child: WeatherInfoItem(
            icon: 'assets/icons/wind_icon.png',
            title: 'WIND',
            value: '$windSpeed m/s',
          ),
        ),
        Expanded(
          child: WeatherInfoItem(
            icon: 'assets/icons/feels_like_icon.png',
            title: 'FEELS LIKE',
            value: '${feelsLike.toStringAsFixed(1)}°',
          ),
        ),
      ],
    );
  }
}
