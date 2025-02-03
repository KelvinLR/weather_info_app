import 'package:flutter/material.dart';
import 'package:lapisco_challenge/app/ui/widgets/forecast_graph/custom_bar_chart.dart';

class WeeklySummaryCard extends StatelessWidget {
  final CustomBarChart customBarChart;
  const WeeklySummaryCard({
    super.key,
    required this.customBarChart,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return Container(
      width: deviceWidth * (343 / 423),
      height: deviceHeight * (217 / 858),
      decoration: BoxDecoration(
        color: const Color.fromARGB(97, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: customBarChart,
      ),
    );
  }
}
