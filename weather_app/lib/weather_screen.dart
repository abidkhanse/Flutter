import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/widgets/additional_information_ite.dart';
import 'package:weather_app/widgets/hourly_forecast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather app",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("Reresh");
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox (
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300 F',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Icon(
                            Icons.cloud,
                            size: 48,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text('Weather Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
            ),

            const SizedBox(height: 16),
            const SingleChildScrollView (
              scrollDirection: Axis.horizontal,
              child: Row (
                children: [

                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),

                ],
              ),
            ),

            const SizedBox(height: 16),
            const Text('Additional Information',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                )
            ),

            const SizedBox(height: 20),

            const Row (
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                AdditionalInformationItem(icon: Icons.water_drop, label: 'Humidity', value: '91'),
                AdditionalInformationItem(icon: Icons.air, label: 'Wind Speed', value: '7.5'),
                AdditionalInformationItem(icon: Icons.beach_access, label: 'Pressure', value: '320.12'),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
