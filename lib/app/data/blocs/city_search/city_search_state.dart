import 'package:lapisco_challenge/app/data/models/city_model.dart';
import 'package:lapisco_challenge/app/data/models/current_weather_model.dart';
import 'package:lapisco_challenge/app/data/models/daily_weather_model.dart';

abstract class CitySearchState {}

class CityDataLoading extends CitySearchState {}

class CityDataLoaded extends CitySearchState {
  final CityModel cityData;
  final CurrentWeatherModel currentWeatherData;
  final DailyWeatherModel dailyWeatherData;

  CityDataLoaded(
      {required this.cityData,
      required this.currentWeatherData,
      required this.dailyWeatherData});
}

class CityDataError extends CitySearchState {}
