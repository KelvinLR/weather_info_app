import 'dart:convert';

import 'package:lapisco_challenge/app/data/http/exceptions.dart';
import 'package:lapisco_challenge/app/data/http/http_client.dart';
import 'package:lapisco_challenge/app/data/models/current_location_model.dart';

abstract class CurrentLocationInterface {
  Future<CurrentLocationModel> getCurrentLocation(String ip);
}

class CurrentLocationRepository implements CurrentLocationInterface {
  final HttpClientInterface client;
  CurrentLocationRepository({required this.client});

  @override
  Future<CurrentLocationModel> getCurrentLocation(String ip) async {
    final response = await client.get(url: 'https://ipapi.co/$ip/json/');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return CurrentLocationModel(
          cityName: body['city'] ?? "",
          region: body['region_code'] ?? "",
          country: body['country_name'] ?? "",
          latitude: body['latitude'] ?? 0.0,
          longitude: body['longitude'] ?? 0.0);
    } else if (response.statusCode == 404) {
      throw NotFoundException('Invalid URL');
    } else {
      throw Exception('City not found');
    }
  }
}
