import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_state.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_bloc.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_event.dart';
import 'package:lapisco_challenge/app/ui/widgets/forecast_graph/custom_bar_chart.dart';
import 'package:lapisco_challenge/app/ui/widgets/weekly_summary_card/weekly_summary_card.dart';

class WeatherInfoPage extends StatelessWidget {
  const WeatherInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return BlocProvider(
      create: (context) => CitySearchBloc(),
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF08244F),
                Color(0xFF134CB5),
                Color(0xFF0B42AB),
              ],
              stops: [0, 0.47, 1.00],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
            ),
          ),
          child: Column(
            children: [
              Builder(builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: deviceHeight * (44 / 858),
                    left: deviceWidth * (41 / 423),
                    right: deviceWidth * (41 / 423),
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Enter a location",
                      filled: true,
                      fillColor: const Color(0xFFFFFFFF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                    onSubmitted: (value) {
                      context
                          .read<CitySearchBloc>()
                          .add(SearchCityDataEvent(localName: value));
                      controller.clear();
                    },
                  ),
                );
              }),
              BlocBuilder<CitySearchBloc, CitySearchState>(
                builder: (context, state) {
                  if (state is CityDataLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is CityDataLoaded) {
                    return Column(
                      children: [
                        /*Text(state.cityData.name),
                        Text("${state.cityData.latitude}"),
                        Text("${state.cityData.longitude}"),
                        Text("${state.cityData.elevation}"),
                        Text("${state.currentWeatherData.apparentTemperature}"),
                        Text("${state.currentWeatherData.currentTemperature}"),
                        Text("${state.currentWeatherData.windSpeed}"),
                        Text("${state.currentWeatherData.precipitation}"),
                        Text("${state.currentWeatherData.isDay}"),
                        Text("${state.currentWeatherData.relativeHumidity}"),
                        Text("${state.dailyWeatherData.days}"),
                        Text("${state.dailyWeatherData.maxTemperature}"),
                        Text("${state.dailyWeatherData.minTemperature}"),
                        Text("${state.dailyWeatherData.maxUvIndex}"),
                        Text("${state.dailyWeatherData.windSpeed}"),*/
                        Text(
                          state.cityData.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                            "currentTemperature: ${state.currentWeatherData.currentTemperature} °C"),
                        Text(
                            "apparentTemperature: ${state.currentWeatherData.apparentTemperature} °C"),
                        Text(
                            "windSpeed: ${state.currentWeatherData.windSpeed} km/h"),
                        Text(
                            "precipitation: ${state.currentWeatherData.precipitation} mm"),
                        Text(
                            "weatherCode: ${state.currentWeatherData.weatherCode}"),
                        const Text('Last 7 days average temperature'),
                        WeeklySummaryCard(
                          customBarChart: CustomBarChart(
                            weeklySummary:
                                state.dailyWeatherData.maxTemperature,
                            minY: state.dailyWeatherData.maxTemperature.reduce(
                                (curr, next) => curr < next ? curr : next),
                            maxY: state.dailyWeatherData.maxTemperature.reduce(
                                (curr, next) => curr > next ? curr : next),
                          ),
                        )
                      ],
                    );
                  } else if (state is CityDataError) {
                    return const Text("Search failed");
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
