class WeatherModel {
  /// All Attributes API
  final String? name;
  final int? timeZone;
  final num? temprature;
  final String? description;
  final num? humidity;
  final num? windSpeed;
  final num? feelsLike;
  final int? sunrise;
  final int? sunset;
  final int? dt;
  double get tempInCelsius => temprature! - 273.15;

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
