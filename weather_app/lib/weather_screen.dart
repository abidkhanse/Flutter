import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/additional_information_ite.dart';
import 'package:weather_app/widgets/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  final String api_key = "1cd340357663bac58a3ebbc88d059e65";
  final city = "London";

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final res = await http.get (
          Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=1cd340357663bac58a3ebbc88d059e65')
      );

      final data = jsonDecode(res.body);
      final String code = data['cod'];
      if(code != '200') {
        throw 'Weather data is not available';
      }
      return data;

    } catch(e) {
      throw e.toString();
    }
  }

  IconData getWeatherIcon(String weatherStatus) {

    if (weatherStatus == 'Clouds') {
      return Icons.cloud;
    } else if (weatherStatus == 'Rain') {
      return Icons.cloudy_snowing;
    } else {
      return Icons.sunny;
    }


  }

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
              setState(() {
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder (

        future: getCurrentWeather(),
        builder: (context, snapshot) {

          if ( snapshot.connectionState == ConnectionState.waiting ) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if( snapshot.hasError ){
            return Text(snapshot.error.toString());
          }

          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];

          final temp = currentWeatherData['main']['temp'];
          final sky = currentWeatherData['weather'][0]['main'];

          final currentPressure = currentWeatherData['main']['pressure'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final windSpeed       = currentWeatherData['wind']['speed'];

          return Padding (

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
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              '$temp K',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Icon (getWeatherIcon(sky), size: 48 ),
                            Text(
                              sky,
                              style: const TextStyle(fontSize: 20),
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

               /*
               SingleChildScrollView (
                scrollDirection: Axis.horizontal,
                child: Row (
                  children: [
                    for(int i = 0; i < 6; i++)
                      HourlyForecastItem(weather_time: data['list'][i+1]['dt_txt'].substring(11, 16).toString(),
                          icon: getWeatherIcon(data['list'][i+1]['weather'][0]['main'].toString()),
                          temp: data['list'][i+1]['main']['temp'].toString()),
                  ],
                ),
              ),
              */

              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    final timeStamp = data['list'][index+1]['dt_txt'].substring(11, 16).toString();
                    final weatherIcon = getWeatherIcon(data['list'][index]['weather'][0]['main'].toString());
                    final temperature = data['list'][index+1]['main']['temp'].toString();

                    return HourlyForecastItem(weather_time: timeStamp,
                        icon: weatherIcon,
                        temp: temperature);

                  },
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

              Row (

                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  AdditionalInformationItem(icon: Icons.water_drop, label: 'Humidity', value: currentHumidity.toString()),
                  AdditionalInformationItem(icon: Icons.air, label: 'Wind Speed', value: windSpeed.toString()),
                  AdditionalInformationItem(icon: Icons.beach_access, label: 'Pressure', value: currentPressure.toString()),
                ],
              ),
            ],
          ),
        );
        },
      ),
    );
  }
}
