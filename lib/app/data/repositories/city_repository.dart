import 'dart:convert';

import 'package:lapisco_challenge/app/data/http/exceptions.dart';
import 'package:lapisco_challenge/app/data/http/http_client.dart';
import 'package:lapisco_challenge/app/data/models/city_model.dart';

abstract class CityRepositoryInterface {
  Future<CityModel> getCityInformation(double latitude, double longitude);
}

class CityRepository implements CityRepositoryInterface {
  final HttpClientInterface client;
  CityRepository({required this.client});

  @override
  Future<CityModel> getCityInformation(
      double latitude, double longitude) async {
    final response = await client.get(
        url:
            'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return CityModel(
          latitude: body['latitude'],
          longitude: body['longitude'],
          timeZone: body['timezone'],
          timeZoneAbbreviation: body['timezone_abbreviation'],
          elevation: body['elevation']);
    } else if (response.statusCode == 404) {
      throw NotFoundException('Invalid URL');
    } else {
      throw Exception('City not found');
    }
  }
}
