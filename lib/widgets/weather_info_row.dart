import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_info_icon.dart';

class WeatherInfoRow extends StatelessWidget {
  final int humidity;
  final double windSpeed;
  final double feelsLike;
  const WeatherInfoRow({
    super.key,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherInfoItem(
          icon: 'assets/icons/humidity_icon.png',
          title: 'HUMIDITY',
          value: '${humidity}%',
        ),
        WeatherInfoItem(
          icon: 'assets/icons/wind_icon.png',
          title: 'WIND',
          value: '${windSpeed} m/s',
        ),
        WeatherInfoItem(
          icon: 'assets/icons/feels_like_icon.png',
          title: 'Feels Like',
          value: '${feelsLike.toStringAsFixed(1)}°',
        ),
      ],
    );
  }
}
