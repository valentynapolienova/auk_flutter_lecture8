import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  WeatherService(this.apiKey);

  final String apiKey;

  // Base URL for OpenWeatherMap current weather.
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> getWeatherByCity(String city) async {
    final uri = Uri.parse('$_baseUrl?q=$city&appid=$apiKey&units=metric');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load weather (${response.statusCode})');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Weather.fromJson(data);
  }
}
