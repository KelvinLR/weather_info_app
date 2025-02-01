import 'package:flutter/material.dart';

class WeatherInfoPage extends StatefulWidget {
  const WeatherInfoPage({super.key});

  @override
  State<WeatherInfoPage> createState() => _WeatherInfoPageState();
}

class _WeatherInfoPageState extends State<WeatherInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Weather Info App'),
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
                hintText: "Enter a location to show weather information"),
          ),
          Container(
            child: Text("Melbourne"),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.abc_outlined),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
