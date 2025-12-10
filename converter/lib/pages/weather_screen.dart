import 'dart:ui';
import 'package:converter/pages/waether_items.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Future getCurrent() async {
  //   String cityname = 'London';
  //  final res = await http.get(Uri.parse());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            '300 F',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 16),
                          Text('Rain', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'weather forecast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Forecast(
                    icon: Icons.water_drop,
                    label: '02:40',
                    value: '300.6',
                  ),
                  Forecast(icon: Icons.sunny, label: '02:40', value: '300.6'),
                  Forecast(icon: Icons.cloud, label: '02:40', value: '300.6'),
                  Forecast(icon: Icons.sunny, label: '02:40', value: '300.6'),
                  Forecast(icon: Icons.cloud, label: '02:40', value: '300.6'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Additional information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfo(
                  icon: Icons.water_drop,
                  label: 'humidity',
                  value: '91',
                ),
                AdditionalInfo(
                  icon: Icons.air,
                  label: 'windspeed',
                  value: '7.5',
                ),
                AdditionalInfo(
                  icon: Icons.beach_access,
                  label: 'pressure',
                  value: '1000',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
