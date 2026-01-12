import 'package:flutter/material.dart';

class WeatherInfoItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  const WeatherInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // shadow color
                blurRadius: 10, // shadow smoothness
                spreadRadius: 1, // shadow size
                offset: Offset(0, 5), // x, y position
              ),
            ],
          ),
          child: Image.asset(icon, height: 40, width: 40, color: Colors.black),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(value, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
