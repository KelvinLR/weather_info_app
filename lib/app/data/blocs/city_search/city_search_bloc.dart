import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_event.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_state.dart';
import 'package:lapisco_challenge/app/data/http/http_client.dart';
import 'package:lapisco_challenge/app/data/repositories/city_repository.dart';
import 'package:lapisco_challenge/app/data/repositories/current_weather_repository.dart';
import 'package:lapisco_challenge/app/data/repositories/daily_weather_repository.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  final CityRepository cityRepository = CityRepository(client: HttpClient());
  final CurrentWeatherRepository currentWeatherRepository =
      CurrentWeatherRepository(client: HttpClient());
  final DailyWeatherRepository dailyWeatherRepository =
      DailyWeatherRepository(client: HttpClient());

  CitySearchBloc() : super(CityDataLoading()) {
    on<SearchCityDataEvent>(_onSearchCityDataEvent);
  }

  Future<void> _onSearchCityDataEvent(
      SearchCityDataEvent event, Emitter<CitySearchState> emit) async {
    emit(CityDataLoading());

    final cityData = await cityRepository.getCityInformation(
        event.latitude, event.longitude);
    final currentWeather = await currentWeatherRepository.getCurrentWeatherData(
        event.latitude, event.longitude);
    final dailyWeather = await dailyWeatherRepository.getDailyWeatherData(
        event.latitude, event.longitude);

    emit(CityDataLoaded(
      cityData: cityData,
      currentWeatherData: currentWeather,
      dailyWeatherData: dailyWeather,
    ));
  }
}
