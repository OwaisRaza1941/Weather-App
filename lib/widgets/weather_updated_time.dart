import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherUpdateTime extends StatelessWidget {
  final int timestamp;
  const WeatherUpdateTime({super.key, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    final formattedDate = DateFormat('hh:mm a').format(date);
    return Text(
      'Updated at $formattedDate',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }
}
