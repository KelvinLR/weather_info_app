import 'package:flutter/material.dart';

class DetailedCard extends StatelessWidget {
  final double currentUvIndex;
  final int relativeHumidity;
  final double currentWindSpeed;

  const DetailedCard(
      {super.key,
      required this.currentUvIndex,
      required this.relativeHumidity,
      required this.currentWindSpeed});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return Container(
      width: deviceWidth * (343 / 423),
      height: deviceHeight * (47 / 858),
      decoration: BoxDecoration(
        color: const Color.fromARGB(45, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: "UV Index ",
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "$currentUvIndex",
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),RichText(
              text: TextSpan(
                text: "Humidity ",
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "$relativeHumidity",
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),RichText(
              text: TextSpan(
                text: "Wind ",
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "$currentWindSpeed km/h",
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
