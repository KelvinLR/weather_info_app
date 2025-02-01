class DailyWeatherModel {
  final List<double> maxTemperature;
  final List<double> minTemperature;
  final List<double> maxUvIndex;
  final List<double> windSpeed;

  DailyWeatherModel({
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxUvIndex,
    required this.windSpeed,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      maxTemperature: List<double>.from(json['temperature_2m_max']),
      minTemperature: List<double>.from(json['temperature_2m_min']),
      maxUvIndex: List<double>.from(json['uv_index_max']),
      windSpeed: List<double>.from(json['wind_speed_10m_max']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature_2m_max': maxTemperature,
      'temperature_2m_min': minTemperature,
      'uv_index_max': maxUvIndex,
      'wind_speed_10m_max': windSpeed,
    };
  }

  Future<DailyWeatherModel> fetchDailyWeatherData() async {
    final url = Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=-3.7172&longitude=-38.5431&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,wind_speed_10m&daily=temperature_2m_max,temperature_2m_min,uv_index_max,wind_speed_10m_max&timezone=America%2FSao_Paulo");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return DailyWeatherModel.fromJson(data['Daily']);
    } else {
      throw Exception('Failure at loading data');
    }
  }
}
