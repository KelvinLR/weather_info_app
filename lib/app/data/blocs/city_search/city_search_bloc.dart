import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_event.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_state.dart';
import 'package:lapisco_challenge/app/data/http/http_client.dart';
import 'package:lapisco_challenge/app/data/repositories/city_repository.dart';
import 'package:lapisco_challenge/app/data/repositories/current_location_repository.dart';
import 'package:lapisco_challenge/app/data/repositories/current_weather_repository.dart';
import 'package:lapisco_challenge/app/data/repositories/daily_weather_repository.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  final CityRepository cityRepository = CityRepository(client: HttpClient());
  final CurrentWeatherRepository currentWeatherRepository =
      CurrentWeatherRepository(client: HttpClient());
  final DailyWeatherRepository dailyWeatherRepository =
      DailyWeatherRepository(client: HttpClient());
  final CurrentLocationRepository currentLocationRepository =
      CurrentLocationRepository(client: HttpClient());

  CitySearchBloc() : super(CityDataLoading()) {
    on<SearchCityDataEvent>(_onSearchCityDataEvent);
    on<SearchCurrentLocationDataEvent>(_onSearchCurrentLocationDataEvent);
  }

  Future<void> _onSearchCityDataEvent(
      SearchCityDataEvent event, Emitter<CitySearchState> emit) async {
    emit(CityDataLoading());

    List<Location> local = await cityRepository.fetchLocation(event.localName);

    final cityData = await cityRepository.getCityInformation(
        local.first.latitude, local.first.longitude);
    final currentWeather = await currentWeatherRepository.getCurrentWeatherData(
        local.first.latitude, local.first.longitude);
    final dailyWeather = await dailyWeatherRepository.getDailyWeatherData(
        local.first.latitude, local.first.longitude);

    emit(CityDataLoaded(
      cityData: cityData,
      currentWeatherData: currentWeather,
      dailyWeatherData: dailyWeather,
    ));
  }

  Future<void> _onSearchCurrentLocationDataEvent(
      SearchCurrentLocationDataEvent event,
      Emitter<CitySearchState> emit) async {
    emit(CityDataLoading());

    var ipAddress = IpAddress(type: RequestType.json);
    var deviceIpAddress = (await ipAddress.getIpAddress())["ip"];
    final currentLocationData =
        await currentLocationRepository.getCurrentLocation(deviceIpAddress);

    final cityData = await cityRepository.getCityInformation(
        currentLocationData.latitude, currentLocationData.longitude);
    final currentWeather = await currentWeatherRepository.getCurrentWeatherData(
        currentLocationData.latitude, currentLocationData.longitude);
    final dailyWeather = await dailyWeatherRepository.getDailyWeatherData(
        currentLocationData.latitude, currentLocationData.longitude);

    emit(CityDataLoaded(
        cityData: cityData,
        currentWeatherData: currentWeather,
        dailyWeatherData: dailyWeather));
  }
}
