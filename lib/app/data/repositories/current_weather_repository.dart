import 'dart:convert';
import 'package:lapisco_challenge/app/data/http/exceptions.dart';
import 'package:lapisco_challenge/app/data/http/http_client.dart';
import 'package:lapisco_challenge/app/data/models/current_weather_model.dart';

abstract class CurrentWeatherInterface {
  Future<CurrentWeatherModel> getCurrentWeatherData(
      double latitude, double longitude);
}

class CurrentWeatherRepository implements CurrentWeatherInterface {
  final HttpClientInterface client;
  CurrentWeatherRepository({required this.client});

  @override
  Future<CurrentWeatherModel> getCurrentWeatherData(
      double latitude, double longitude) async {
    final response = await client.get(
      url:
          'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,is_day,precipitation,uv_index,wind_speed_10m&',
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return CurrentWeatherModel(
        currentTemperature: body['current']['temperature_2m'] ?? 0.0,
        relativeHumidity: body['current']['relative_humidity_2m'] ?? 0,
        apparentTemperature: body['current']['apparent_temperature'] ?? 0.0,
        weatherCode: body['current']['weather_code'] ?? 0,
        uvIndex: body['current']['uv_index'] ?? 0.0,
        isDay: body['current']['is_day'] ?? 0,
        precipitation: body['current']['precipitation'] ?? 0,
        windSpeed: body['current']['wind_speed_10m'] ?? 0.0,
      );
    } else if (response.statusCode == 404) {
      throw NotFoundException('Invalid URL');
    } else {
      throw Exception('City not found');
    }
  }
}
