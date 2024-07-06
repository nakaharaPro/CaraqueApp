import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum Weather {
  sunny,
  cloudy,
  rainy,
  snowy,
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather _currentWeather = Weather.sunny;//初期値

  void _updateWeather(Weather weather) {
    setState(() {
      _currentWeather = weather;
    });
  }

  String _getWeatherMessage() {
    switch (_currentWeather) {
      case Weather.sunny:
        return 'It\'s sunny!';
      case Weather.cloudy:
        return 'It\'s cloudy!';
      case Weather.rainy:
        return 'It\'s rainy!';
      case Weather.snowy:
        return 'It\'s snowy!';
      default:
        return 'Unknown weather';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
              _getWeatherMessage(),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: Weather.values.map((weather) {
                return ElevatedButton(
                  onPressed: () => _updateWeather(weather),
                  child: Text(weather.toString().split('.').last),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
