import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherController extends GetxController {
  /// Obsorbable List
  RxList<WeatherModel> allWeatherData = <WeatherModel>[].obs;

  /// Get Weather Data and Add Reactive List
  Future<void> getWeather() async {
    try {
      List<dynamic> data = await WeatherServices.get().timeout(
        Duration(seconds: 3),
      );
      for (var item in data) {
        allWeatherData.add(WeatherModel.fromJson(item));
      }
    } on SocketException {
      Get.snackbar(
        'No Internet',
        'Please check your Internet connect, Try again',
      );
    } on TimeoutException {
      Get.snackbar('Da', 'message');
    } catch (e) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar('Please Wrong', 'Some thin wrong');
      }
    }
  }
}
