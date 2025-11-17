class WeatherModel {
  /// All Attributes API
  final String? name;
  final int? timeZone;
  final double? temprature;
  final String? description;
  final int? humidity;
  final double? wind;
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
    this.wind,
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
      wind: json['wind']['speed'],
      feelsLike: json['main']['feels_like'],
      sunrise: json["sys"]['sunrise'],
      sunset: json["sys"]['sunset'],
      dt: json['dt'],
    );
  }
}
