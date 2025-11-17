class WeatherModel {
  /// All Attributes API
  String? name;
  double? timeZone;
  double? temprature;
  String? description;
  int? humidity;
  double? wind;
  double? feelsLike;
  int? sunrise;
  int? sunset;

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
  });

  /// Convert JSON data into (DART MODEL) Class
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['name'],
      timeZone: json['timezone'],
      temprature: json['main']['temp'],
      description: json['weather']['description'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'],
      feelsLike: json['main']['feels_like'],
      sunrise: json["sys"]['sunrise'],
      sunset: json["sys"]['sunset'],
    );
  }
}
