import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_state.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_bloc.dart';
import 'package:lapisco_challenge/app/data/blocs/city_search/city_search_event.dart';
import 'package:lapisco_challenge/app/ui/widgets/detailed_card/detailed_card.dart';
import 'package:lapisco_challenge/app/ui/widgets/forecast_graph/custom_bar_chart.dart';
import 'package:lapisco_challenge/app/ui/widgets/weather_code/weather_code.dart';
import 'package:lapisco_challenge/app/ui/widgets/weekly_summary_card/weekly_summary_card.dart';

class WeatherInfoPage extends StatelessWidget {
  const WeatherInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return BlocProvider<CitySearchBloc>(
      create: (context) => CitySearchBloc(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF08244F),
          child: const Icon(
            Icons.my_location_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            context
                .read<CitySearchBloc>()
                .add(SearchCurrentLocationDataEvent());
          },
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient:
                (MediaQuery.of(context).platformBrightness == Brightness.dark)
                    ? const LinearGradient(
                        colors: [
                          Color(0xFF08244F),
                          Color(0xFF134CB5),
                          Color(0xFF0B42AB),
                        ],
                        stops: [0, 0.47, 1.00],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 1.0),
                      )
                    : const LinearGradient(
                        colors: [
                          Color(0xFF29B2DD),
                          Color(0xFF33AADD),
                          Color(0xFF2DC8EA),
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
                    top: deviceHeight * (64 / 858),
                    left: deviceWidth * (41 / 423),
                    right: deviceWidth * (41 / 423),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    controller: controller,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                      hintText: "Enter a location",
                      hintStyle: const TextStyle(color: Colors.white),
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      filled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0.8,
                          style: BorderStyle.solid,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0.8,
                          style: BorderStyle.solid,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0.8,
                          style: BorderStyle.solid,
                          color: Colors.white,
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
              Container(
                height: deviceHeight * (31 / 858),
              ),
              BlocBuilder<CitySearchBloc, CitySearchState>(
                builder: (context, state) {
                  if (state is CityDataLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is CityDataLoaded) {
                    return Column(
                      spacing: 1,
                      children: [
                        Text(
                          state.cityData.name,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        WeatherCode(
                            weatherCode: state.currentWeatherData.weatherCode),
                        Text(
                          "${state.currentWeatherData.currentTemperature.toStringAsFixed(0)}°",
                          style: const TextStyle(
                            fontSize: 64,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Apparent temperature ",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "${state.currentWeatherData.apparentTemperature.toStringAsFixed(0)}°",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: deviceHeight * (10 / 858),
                        ),
                        DetailedCard(
                          currentUvIndex: state.currentWeatherData.uvIndex,
                          currentWindSpeed: state.currentWeatherData.windSpeed,
                          relativeHumidity:
                              state.currentWeatherData.relativeHumidity,
                        ),
                        Container(
                          height: deviceHeight * (20 / 858),
                        ),
                        WeeklySummaryCard(customBarChartList: [
                          CustomBarChart(
                            title: "Max temperature - Next 7 days",
                            weeklySummary:
                                state.dailyWeatherData.maxTemperature,
                            minY: state.dailyWeatherData.maxTemperature.reduce(
                                (curr, next) => curr < next ? curr : next),
                            maxY: state.dailyWeatherData.maxTemperature.reduce(
                                (curr, next) => curr > next ? curr : next),
                          ),
                          CustomBarChart(
                            title: "Min temperature - Next 7 days",
                            weeklySummary:
                                state.dailyWeatherData.minTemperature,
                            minY: state.dailyWeatherData.minTemperature.reduce(
                                (curr, next) => curr < next ? curr : next),
                            maxY: state.dailyWeatherData.minTemperature.reduce(
                                (curr, next) => curr > next ? curr : next),
                          ),
                        ])
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
