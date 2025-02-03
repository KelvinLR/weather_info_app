import 'package:lapisco_challenge/app/ui/widgets/forecast_graph/individual_bar.dart';

class BarData {
  final double firstDayData;
  final double secondDayData;
  final double thirdDayData;
  final double fourthDayData;
  final double fifthDayData;
  final double sixthDayData;
  final double seventhDayData;

  BarData({
    required this.firstDayData,
    required this.secondDayData,
    required this.thirdDayData,
    required this.fourthDayData,
    required this.fifthDayData,
    required this.sixthDayData,
    required this.seventhDayData,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: firstDayData),
      IndividualBar(x: 0, y: secondDayData),
      IndividualBar(x: 0, y: thirdDayData),
      IndividualBar(x: 0, y: fourthDayData),
      IndividualBar(x: 0, y: fifthDayData),
      IndividualBar(x: 0, y: sixthDayData),
      IndividualBar(x: 0, y: seventhDayData),
    ];
  }
}
