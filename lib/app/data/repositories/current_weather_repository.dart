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
            'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,wind_speed_10m&');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return CurrentWeatherModel(
          currentTemperature: body['temperature_2m'],
          relativeHumidity: body['relative_humidity_2m'],
          apparentTemperature: body['apparent_temperature'],
          isDay: body['is_day'],
          precipitation: body['precipitation'],
          windSpeed: body['wind_speed_10m']);
    } else if (response.statusCode == 404) {
      throw NotFoundException('Invalid URL');
    } else {
      throw Exception('City not found');
    }
  }
}
