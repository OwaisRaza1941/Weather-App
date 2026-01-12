import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/widgets/tempature_deggree.dart';
import 'package:weather_app/widgets/weather_date.dart';
import 'package:weather_app/widgets/weather_icon.dart';
import 'package:weather_app/widgets/weather_info_row.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userSearchController = TextEditingController();
    WeatherController controller = Get.put(WeatherController());

    Future<void> searchCity(String city) async {
      if (city.isEmpty) {
        Get.snackbar(
          'Required',
          'Please enter city name',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      await controller.getWeather(city);
      Get.back(); // loading close
    }

    return GestureDetector(
      onTap: () {
        Focus.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade200, Colors.grey.shade200],
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 280,
                            child: TextField(
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) async {
                                await searchCity(value);
                              },
                              controller: userSearchController,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search for a city....',
                                hintStyle: TextStyle(color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey.shade200,
                            child: Transform.rotate(
                              angle: -1, // radians mein hota hai
                              child: Icon(
                                Icons.nightlight_sharp,
                                size: 30,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Obx(() {
                        if (controller.allWeatherData.isEmpty) {
                          return Center(
                            child: Text(
                              'No Weather Data',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        var weather = controller.allWeatherData[0];
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                weather.name!,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              WeatherDate(timestamp: weather.dt!),
                              SizedBox(height: 20),
                              WeatherConditionIcon(model: weather),
                              TempatureDeggree(
                                tempature: weather.tempInCelsius
                                    .toStringAsFixed(0),
                              ),
                              Text(
                                weather.description!,
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 20),
                              WeatherInfoRow(
                                humidity: weather.humidity!,
                                windSpeed: weather.windSpeed!,
                                feelsLike: weather.feelsLike!,
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() {
              if (!controller.isLoading.value) return SizedBox();

              return Container(
                color: Colors.black.withOpacity(0.2),
                child: Center(
                  child: Container(
                    width: 220,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text("Loading weather data..."),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
