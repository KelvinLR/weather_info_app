class DailyWeatherModel {
  final List<String> days;
  final List<double> maxTemperature;
  final List<double> minTemperature;
  final List<double> maxUvIndex;
  final List<double> windSpeed;

  DailyWeatherModel({
    required this.days,
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxUvIndex,
    required this.windSpeed,
  });

  factory DailyWeatherModel.fromMap(Map<String, dynamic> map) {
    return DailyWeatherModel(
      days: List<String>.from(map['time']),
      maxTemperature: List<double>.from(map['temperature_2m_min']),
      minTemperature: List<double>.from(map['temperature_2m_max']),
      maxUvIndex: List<double>.from(map['uv_index_max']),
      windSpeed: List<double>.from(map['wind_speed_10m_max']),
    );
  }
}
