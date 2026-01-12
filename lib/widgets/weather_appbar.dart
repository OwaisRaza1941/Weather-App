import 'package:flutter/material.dart';

class WeatherAppBar extends StatelessWidget {
  final String cityName;
  const WeatherAppBar(this.cityName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_sharp, size: 30, color: Colors.black),
        SizedBox(width: 15),
        Text(
          cityName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, size: 30, color: Colors.black),
        ),
      ],
    );
  }
}
