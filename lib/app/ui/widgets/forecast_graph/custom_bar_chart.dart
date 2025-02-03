import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lapisco_challenge/app/ui/widgets/forecast_graph/bar_data.dart';

class CustomBarChart extends StatelessWidget {
  final List weeklySummary;
  final String title;
  final double maxY;
  final double minY;
  const CustomBarChart(
      {super.key,
      required this.weeklySummary,
      required this.title,
      required this.maxY,
      required this.minY});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      firstDayData: weeklySummary[0],
      secondDayData: weeklySummary[1],
      thirdDayData: weeklySummary[2],
      fourthDayData: weeklySummary[3],
      fifthDayData: weeklySummary[4],
      sixthDayData: weeklySummary[5],
      seventhDayData: weeklySummary[6],
    );

    myBarData.initializeBarData();
    return Column(
      spacing: 16,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style:  const TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 3,
          child: BarChart(
            BarChartData(
              minY: minY,
              maxY: maxY,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: const FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(),
                ),
              ),
              barGroups: myBarData.barData
                  .map(
                    (data) => BarChartGroupData(
                      x: data.x,
                      barRods: [
                        BarChartRodData(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          width: 16,
                          toY: data.y,
                          color: (data.y >= 0.0) ? Colors.orange : Colors.blue,

                          // gradient: LinearGradient(colors: colors)
                        )
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Container(
          height: 20,
        )
      ],
    );
  }
}
