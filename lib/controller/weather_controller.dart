import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/widgets/network_error.dart';
import 'package:weather_app/widgets/timeout_dailog.dart';

class WeatherController extends GetxController {
  /// Obsorbable List
  RxList<WeatherModel> allWeatherData = <WeatherModel>[].obs;

  /// Loading Bar
  RxBool isLoading = false.obs;

  /// Get Weather Data and Add Reactive List
  Future<void> getWeather(String cityName) async {
    isLoading.value = true;
    try {
      Map response = await WeatherServices.get(
        cityName,
      ).timeout(Duration(seconds: 5));

      allWeatherData.clear();
      allWeatherData.add(WeatherModel.fromJson(response));
    } on SocketException {
      Get.to(NetworkError());
    } on TimeoutException {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return TimeoutDailog(
            onRetry: () async {
              await getWeather(cityName);
            },
          );
        },
      );
    } catch (e) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar('Please Wrong', 'Some thing went wrong!');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
