import 'package:flutter/material.dart';

class WeatherDate extends StatelessWidget {
  const WeatherDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'June 07',
      style: TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
