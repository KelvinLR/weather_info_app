import 'package:flutter/material.dart';
import 'package:lapisco_challenge/app/ui/widgets/weather_code/weather_code_assets.dart';

class WeatherCode extends StatelessWidget {
  final int weatherCode;
  const WeatherCode({super.key, required this.weatherCode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/weather_icons/${weatherCodeAsset[weatherCode]?['asset']}"),
        Text("${weatherCodeAsset[weatherCode]?['name']}", style: const TextStyle(color: Color(0xFFFFFFFF)),)
      ],
    );
  }
}
