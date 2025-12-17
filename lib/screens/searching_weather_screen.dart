import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/styles.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/screens/weather_screen.dart';

class SearchingWeatherScreen extends StatelessWidget {
  const SearchingWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userSearchController = TextEditingController();

    WeatherController controller = Get.put(WeatherController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: Styles.searchingBarStyle,
                child: TextField(
                  controller: userSearchController,
                  cursorColor: Colors.white,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search City',
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        String city = userSearchController.text.trim();
                        if (city.isNotEmpty) {
                          await controller.getWeather(city);
                          Get.to(() => WeatherScreen());
                        } else {
                          Get.snackbar('Required', 'Please enter city name');
                        }
                      },
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
