class CityModel {
  final double latitude;
  final double longitude;
  final String timeZone;
  final String timeZoneAbbreviation;
  final double elevation;
  final Map<String, dynamic> currentInformation;
  //final List<DailyWeatherModel> dailyInformation;

  const CityModel({
    required this.latitude,
    required this.longitude,
    required this.timeZone,
    required this.timeZoneAbbreviation,
    required this.elevation,
    required this.currentInformation,
    //required this.dailyInformation,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        latitude: json['latitude'],
        longitude: json['longitude'],
        timeZone: json['timezone'],
        timeZoneAbbreviation: json['timezone_abbreviation'],
        elevation: json['elevation'],
        currentInformation: json['current']);
    //dailyInformation: json['daily']);
  }
}
