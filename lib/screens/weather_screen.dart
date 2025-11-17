import 'package:flutter/material.dart';
import 'package:weather_app/widgets/tempature_deggree.dart';
import 'package:weather_app/widgets/weather_appbar.dart';
import 'package:weather_app/widgets/weather_date.dart';
import 'package:weather_app/widgets/weather_icon.dart';
import 'package:weather_app/widgets/weather_info_row.dart';
import 'package:weather_app/widgets/weather_updated_time.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/lahores.jpg',
              width: double.infinity,
              height: size.height,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WeatherAppBar(),
                  SizedBox(height: 50),
                  WeatherDate(),
                  SizedBox(height: 15),
                  WeatherUpdateTime(),
                  SizedBox(height: 30),
                  WeatherConditionIcon(),
                  Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TempatureDeggree(),
                  SizedBox(height: 40),
                  WeatherInfoRow(),
                  SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFF535353).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
