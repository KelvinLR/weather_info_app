import 'package:lapisco_challenge/app/data/models/city_model.dart';

abstract class CityRepositoryInterface {
  Future<CityModel> getCity();
}

class CityRepository implements CityRepositoryInterface {
  @override
  Future<CityModel> getCity() {
    throw UnimplementedError();
  }
}
