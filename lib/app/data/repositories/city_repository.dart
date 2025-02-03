import 'dart:convert';
import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:lapisco_challenge/app/data/http/exceptions.dart';
import 'package:lapisco_challenge/app/data/http/http_client.dart';
import 'package:lapisco_challenge/app/data/models/city_model.dart';

abstract class CityRepositoryInterface {
  Future<CityModel> getCityInformation(double latitude, double longitude);
  Future<List<Location>> fetchLocation(String address, {int retries = 3});
}

class CityRepository implements CityRepositoryInterface {
  final HttpClientInterface client;
  CityRepository({required this.client});

  @override
  Future<List<Location>> fetchLocation(String address,
      {int retries = 3}) async {
    for (int attempt = 1; attempt <= retries; attempt++) {
      try {
        return await locationFromAddress(address);
      } catch (e) {
        log("Tentativa $attempt falhou: $e");
        if (attempt == retries) {
          rethrow;
        }
        await Future.delayed(const Duration(seconds: 2));
      }
    }
    throw Exception("Falha ao buscar localização após $retries tentativas");
  }

  @override
  Future<CityModel> getCityInformation(
      double latitude, double longitude) async {
    final response = await client.get(
        url:
            'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      List<Placemark> locationInfo =
          await placemarkFromCoordinates(latitude, longitude);

      return CityModel(
        name: locationInfo.first.subAdministrativeArea ?? "",
        latitude: body['latitude'],
        longitude: body['longitude'],
        timeZone: body['timezone'],
        timeZoneAbbreviation: body['timezone_abbreviation'],
        elevation: body['elevation'],
      );
    } else if (response.statusCode == 404) {
      throw NotFoundException('Invalid URL');
    } else {
      throw Exception('City not found');
    }
  }
}
