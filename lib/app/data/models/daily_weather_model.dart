class DailyWeatherModel {
  final List<double> maxTemperature;
  final List<double> minTemperature;
  final List<double> maxUvIndex;
  final List<double> windSpeed;

  DailyWeatherModel({
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxUvIndex,
    required this.windSpeed,
  });

  factory DailyWeatherModel.fromMap(Map<String, dynamic> map) {
    return DailyWeatherModel(
      maxTemperature: List<double>.from(map['temperature_2m']),
      minTemperature: List<double>.from(map['relative_humidity_2m']),
      maxUvIndex: List<double>.from(map['apparent_temperature']),
      windSpeed: List<double>.from(map['wind_speed_10m']),
    );
  }
}
