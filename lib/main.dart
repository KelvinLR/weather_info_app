import 'package:flutter/material.dart';
import 'package:lapisco_challenge/app/ui/pages/weather_info.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherInfoPage(),
    );
  }
}
