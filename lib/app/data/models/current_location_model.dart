class CurrentLocationModel {
  final double cityName;
  final double latitude;
  final double longitude;

  CurrentLocationModel({
    required this.cityName,
    required this.latitude,
    required this.longitude,
  });

  factory CurrentLocationModel.fromMap(Map<String, dynamic> map) {
    return CurrentLocationModel(
      cityName: map['city'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
