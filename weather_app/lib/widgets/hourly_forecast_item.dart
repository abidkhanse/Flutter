
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {

  final String weather_time;
  final String temp;
  final IconData icon;

  const HourlyForecastItem({
    super.key, required this.weather_time, required this.temp, required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Card (
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column (
          children: [
            Text(
              weather_time,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 8,),
            Icon(icon, size: 32),
            const SizedBox(height: 8,),
            Text(temp)
          ],
        ),
      ),
    );
  }
}
