import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherDate extends StatelessWidget {
  final int timestamp;
  const WeatherDate({super.key, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    // API timestamp seconds mein hota hai → milliseconds banayenge
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String formattedDate = DateFormat('EEEE, MMM d').format(date);

    return Text(
      formattedDate,
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
