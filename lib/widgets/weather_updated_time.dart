import 'package:flutter/material.dart';

class WeatherUpdateTime extends StatelessWidget {
  const WeatherUpdateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'updated 6/7/2024 4:45 PM',
      style:  TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }
}
