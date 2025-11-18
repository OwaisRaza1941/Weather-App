class WeatherModel {
  /// All Attributes API
  final String? name;
  final int? timeZone;
  final double? temprature;
  final String? description;
  final int? humidity;
  final double? windSpeed;
  final double? feelsLike;
  final int? sunrise;
  final int? sunset;
  final int? dt;

  ///Constructor
  WeatherModel({
    this.name,
    this.timeZone,
    this.temprature,
    this.description,
    this.humidity,
    this.windSpeed,
    this.feelsLike,
    this.sunrise,
    this.sunset,
    this.dt,
  });

  /// Convert JSON data into (DART MODEL) Class
  factory WeatherModel.fromJson(Map<dynamic, dynamic> json) {
    return WeatherModel(
      name: json['name'],
      timeZone: json['timezone'],
      temprature: json['main']['temp'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      feelsLike: json['main']['feels_like'],
      sunrise: json["sys"]['sunrise'],
      sunset: json["sys"]['sunset'],
      dt: json['dt'],
    );
  }
}
