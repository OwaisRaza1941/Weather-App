import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherServices {
  // Api KEY
  static const String apiKey = 'fbfd01c9c30f2965b83ed171fcbb2284';

  /// GET API
  static Future<Map> get(String cityName) async {
    Uri uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey',
    );
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404 || response.statusCode == 401) {
      throw 'Error: ${response.statusCode} – Data not found';
    } else {
      throw 'Failed to load students. Status code: ${response.statusCode}';
    }
  }
}
