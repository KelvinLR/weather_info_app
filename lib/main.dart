import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_bloc.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_event.dart';
import 'package:lapisco_challenge/app/ui/pages/weather_info.dart';

void main() {
  runApp(BlocProvider<CitySearchBloc>(
      create: (context) => CitySearchBloc()..add(SearchCurrentLocationDataEvent()),
      child: const MainApp(),
    ),);
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
