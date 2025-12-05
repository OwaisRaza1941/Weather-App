import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/widgets/nointernet.dart';

class WeatherController extends GetxController {
  /// Obsorbable List
  RxList<WeatherModel> allWeatherData = <WeatherModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getWeather();
  }

  /// Get Weather Data and Add Reactive List
  Future<void> getWeather() async {
    isLoading.value = true;
    try {
      Map response = await WeatherServices.get().timeout(Duration(seconds: 10));
      allWeatherData.add(WeatherModel.fromJson(response));
    } on SocketException {
      Get.to(NetworkError());
    } on TimeoutException {
      Get.snackbar('Da', 'message');
    } catch (e) {
      print('Error : $e');
      if (!Get.isSnackbarOpen) {
        Get.snackbar('Please Wrong', 'Some thing went wrong');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
