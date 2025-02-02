class CityModel {
  final String name;
  final double latitude;
  final double longitude;
  final String timeZone;
  final String timeZoneAbbreviation;
  final double elevation;

  const CityModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.timeZone,
    required this.timeZoneAbbreviation,
    required this.elevation,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      timeZone: map['timezone'],
      timeZoneAbbreviation: map['timezone_abbreviation'],
      elevation: map['elevation'],
    );
  }
}
