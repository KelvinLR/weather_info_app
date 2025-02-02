import 'dart:convert';

import 'package:lapisco_challenge/app/data/http/exceptions.dart';
import 'package:lapisco_challenge/app/data/http/http_client.dart';
import 'package:lapisco_challenge/app/data/models/daily_weather_model.dart';

abstract class DailyWeatherInterface {
  Future<DailyWeatherModel> getDailyWeatherData(
      double latitude, double longitude);
}

class DailyWeatherRepository implements DailyWeatherInterface {
  final HttpClientInterface client;
  DailyWeatherRepository({required this.client});

  @override
  Future<DailyWeatherModel> getDailyWeatherData(
      double latitude, double longitude) async {
    final response = await client.get(
        url:
            'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=temperature_2m_max,temperature_2m_min,uv_index_max,wind_speed_10m_max&timezone=America%2FSao_Paulo');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return DailyWeatherModel(
        days: List<String>.from(body['daily']['time'] ?? []),
        maxTemperature:
            List<double>.from(body['daily']['temperature_2m_max'] ?? []),
        minTemperature:
            List<double>.from(body['daily']['temperature_2m_min'] ?? []),
        maxUvIndex: List<double>.from(body['daily']['uv_index_max'] ?? []),
        windSpeed: List<double>.from(body['daily']['wind_speed_10m_max'] ?? []),
      );
    } else if (response.statusCode == 404) {
      throw NotFoundException('Invalid URL');
    } else {
      throw Exception('City not found');
    }
  }
}
