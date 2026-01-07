import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:lottie/lottie.dart';

class WeatherConditionIcon extends StatelessWidget {
  final WeatherModel model;
  const WeatherConditionIcon({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final desc = model.description?.toLowerCase() ?? '';

    if (desc.contains('rain') || desc.contains('drizzle')) {
      return _lottie('assets/images/rain.json');
    } else if (desc.contains('cloud')) {
      return _lottie('assets/images/cloudy.json');
    } else if (desc.contains('snow')) {
      return _lottie('assets/images/snowfall.json');
    } else if (desc.contains('haze') ||
        desc.contains('smoke') ||
        desc.contains('mist') ||
        desc.contains('fog') ||
        desc.contains('clear')) {
      return _lottie('assets/images/sunny.json');
    } else {
      return _lottie('assets/images/sunny.json');
    }
  }

  Widget _lottie(String path) {
    return Lottie.asset(path, width: 150, height: 150, fit: BoxFit.cover);
  }
}
