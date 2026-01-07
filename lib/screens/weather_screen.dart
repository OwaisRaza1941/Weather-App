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
    // final size = MediaQuery.of(context).size;
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
          child: Center(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF4FACFE), // blue
                            Color(0xFF00F2FE), // light blue
                          ],
                        ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
