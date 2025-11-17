import 'package:flutter/material.dart';

class WeatherConditionIcon extends StatelessWidget {
  const WeatherConditionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/sunny.gif',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    );
  }
}
