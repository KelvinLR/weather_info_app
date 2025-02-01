import 'package:lapisco_challenge/app/data/models/current_weather_model.dart';

abstract class CurrentWeatherInterface {
  Future<CurrentWeatherModel> getCurrentWeatherData();
}

class CurrentWeatherRepository implements CurrentWeatherInterface {
  @override
  Future<CurrentWeatherModel> getCurrentWeatherData() {
    throw UnimplementedError();
  }
}
