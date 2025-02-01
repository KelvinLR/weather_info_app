class CurrentWeatherModel {
  final double currentTemperature;
  final int relativeHumidity;
  final double apparentTemperature;
  final int isDay;
  final double precipitation;
  final double windSpeed;

  CurrentWeatherModel({
    required this.currentTemperature,
    required this.relativeHumidity,
    required this.apparentTemperature,
    required this.isDay,
    required this.precipitation,
    required this.windSpeed,
  });
}
