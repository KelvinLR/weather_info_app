/*import 'dart:convert';
import 'dart:developer';
import 'package:lapisco_challenge/app/data/http/http_client.dart';
import 'package:lapisco_challenge/app/data/models/current_location_model.dart';

abstract class CurrentLocationInterface {
  Future<CurrentLocationModel> getCurrentLocation(String ip);
}

class CurrentLocationRepository implements CurrentLocationInterface {
  final HttpClientInterface client;
  CurrentLocationRepository({required this.client});

  String? _cachedIp;
  CurrentLocationModel? _cachedLocation;

  @override
  Future<CurrentLocationModel> getCurrentLocation(String ip) async {
    // Se já buscou a localização antes, retorna do cache
    if (_cachedLocation != null) {
      return _cachedLocation!;
    }

    _cachedIp ??= ip; // Armazena o IP apenas na primeira vez

    final response = await client.get(url: 'https://freeipapi.com/api/json/$_cachedIp/');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      _cachedLocation = CurrentLocationModel(
        cityName: body['city'] ?? "",
        region: body['region_code'] ?? "",
        country: body['country_name'] ?? "",
        latitude: body['latitude'] ?? 0.0,
        longitude: body['longitude'] ?? 0.0,
      );
      log("cached ${_cachedLocation!.cityName} ");
      return _cachedLocation!;
    } else if (response.statusCode == 429) {
      log("response code 429");
      await Future.delayed(Duration(seconds: 10));
      return getCurrentLocation(ip);
    } else {
      throw Exception('City not found');
    }
  }
}*/

// TODO: reimplement this repository