class CurrentLocationModel {
  final String cityName;
  final String region;
  final String country;
  final double latitude;
  final double longitude;

  CurrentLocationModel({
    required this.cityName,
    required this.region,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory CurrentLocationModel.fromMap(Map<String, dynamic> map) {
    return CurrentLocationModel(
      cityName: map['city'],
      region: map['region_code'],
      country: map['country_name'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
