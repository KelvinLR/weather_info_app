class CurrentWeatherModel {
  final double currentTemperature;
  final int relativeHumidity;
  final double apparentTemperature;
  final int weatherCode;
  final double uvIndex;
  final int isDay;
  final double precipitation;
  final double windSpeed;

  CurrentWeatherModel({
    required this.currentTemperature,
    required this.relativeHumidity,
    required this.apparentTemperature,
    required this.weatherCode,
    required this.uvIndex,
    required this.isDay,
    required this.precipitation,
    required this.windSpeed,
  });

  factory CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherModel(
        currentTemperature: map['temperature_2m'],
        relativeHumidity: map['relative_humidity_2m'],
        apparentTemperature: map['apparent_temperature'],
        weatherCode: map['weather_code'],
        uvIndex: map['uv_index'],
        isDay: map['is_day'],
        precipitation: map['precipitation'],
        windSpeed: map['wind_speed_10m']);
  }
}
