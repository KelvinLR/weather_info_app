class CityModel {
  final double latitude;
  final double longitude;
  final String timeZone;
  final String timeZoneAbbreviation;
  final double elevation;
  //final Map<String, dynamic> currentInformation;
  //final List<DailyWeatherModel> dailyInformation;

  const CityModel({
    required this.latitude,
    required this.longitude,
    required this.timeZone,
    required this.timeZoneAbbreviation,
    required this.elevation,
    //required this.currentInformation,
    //required this.dailyInformation,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
        latitude: map['latitude'],
        longitude: map['longitude'],
        timeZone: map['timezone'],
        timeZoneAbbreviation: map['timezone_abbreviation'],
        elevation: map['elevation']);
  }
}
