import 'package:lapisco_challenge/app/data/models/daily_weather_model.dart';

abstract class DailyWeatherInterface {
  Future<DailyWeatherModel> getDailyWeatherData();
}

class DailyWeatherRepository implements DailyWeatherInterface {
  @override
  Future<DailyWeatherModel> getDailyWeatherData() {
    throw UnimplementedError();
  }
}
