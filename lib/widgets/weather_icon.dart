import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:lottie/lottie.dart';

class WeatherConditionIcon extends StatelessWidget {
  final WeatherModel model;
  const WeatherConditionIcon({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if (model.description != null &&
        model.description!.toLowerCase() == 'rain') {
      return Lottie.asset(
        'assets/images/rain.json',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      );
    } else if (model.description != null &&
        model.description!.toLowerCase() == 'cloudy') {
      return Lottie.asset(
        'assets/images/cloudy.json',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      );
    } else if (model.description != null &&
        model.description!.toLowerCase() == 'snowfall') {
      return Lottie.asset(
        'assets/images/snowfall.json',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      );
    } else {
      return Lottie.asset(
        'assets/images/sunny.json',
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      );
    }
  }
}
