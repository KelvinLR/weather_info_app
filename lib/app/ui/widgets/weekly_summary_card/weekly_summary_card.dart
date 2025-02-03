import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lapisco_challenge/app/ui/widgets/forecast_graph/custom_bar_chart.dart';

class WeeklySummaryCard extends StatelessWidget {
  final List<CustomBarChart> customBarChartList;
  const WeeklySummaryCard({
    super.key,
    required this.customBarChartList,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return CarouselSlider(
        items: customBarChartList.map((item) {
          return Builder(builder: (context) {
            return Container(
              width: deviceWidth * (343 / 423),
              height: deviceHeight * (217 / 858),
              decoration: BoxDecoration(
                color: const Color.fromARGB(45, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: item,
              ),
            );
          });
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: deviceHeight * (217 / 858),
          enableInfiniteScroll: false,
        ));
    
  }
}
