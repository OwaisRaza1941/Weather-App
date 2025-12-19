import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_app/controller/weather_controller.dart';
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
    WeatherController controller = Get.find();
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.black,
              size: 50,
            ),
          );
        }

        if (controller.allWeatherData.isEmpty) {
          return Center(
            child: Text(
              'No Weather Data',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          );
        }

        var weather = controller.allWeatherData[0];

        return RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.black,
          onRefresh: controller.refreshWeather,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/lahores.jpg',
                  width: double.infinity,
                  height: size.height,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WeatherAppBar(weather.name!),
                      SizedBox(height: 30),
                      WeatherDate(timestamp: weather.dt!),
                      SizedBox(height: 10),
                      WeatherUpdateTime(timestamp: weather.dt!),
                      SizedBox(height: 20),
                      WeatherConditionIcon(model: weather),
                      Text(
                        weather.description!,
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TempatureDeggree(
                        tempature: weather.tempInCelsius.toStringAsFixed(0),
                      ),
                      SizedBox(height: 20),
                      WeatherInfoRow(
                        humidity: weather.humidity!,
                        windSpeed: weather.windSpeed!,
                        feelsLike: weather.feelsLike!,
                      ),
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
      }),
    );
  }
}
