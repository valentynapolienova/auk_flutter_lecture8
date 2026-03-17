import 'package:flutter/material.dart';
import 'package:lecture6/ui/search_row.dart';
import 'package:lecture6/ui/weather_loading.dart';
import 'package:lecture6/ui/weather_result_view.dart';

import '../models/weather_model.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';
import 'empty_weather_widget.dart';
import 'error_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.apiKey, super.key});

  final String apiKey;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _weatherService = WeatherService(widget.apiKey);
  final _locationService = LocationService();

  final _cityController = TextEditingController();

  Future<Weather>? _weatherFuture;

  @override
  void initState() {
    _getWeatherInCurrentCity();
    super.initState();
  }

  Future<void> _getWeatherInCurrentCity() async {
    final currentCity = await _locationService.getCurrentCity();
    _loadByCity(currentCity: currentCity);
  }

  void _loadByCity({String? currentCity}) {
    final city = currentCity ?? _cityController.text.trim();
    if (city.isEmpty) {
      return;
    }

    setState(() {
      _weatherFuture = _weatherService.getWeatherByCity(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App 🌤️',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0D47A1), Color(0xFF42A5F5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                children: [
                  SearchRow(
                    textEditingController: _cityController,
                    loadWeatherCallback: _loadByCity,
                  ),
                  Expanded(
                    child: FutureBuilder<Weather>(
                      future: _weatherFuture,
                      builder: (context, snapshot) {
                        final isLoading =
                            _weatherFuture == null ||
                            snapshot.connectionState == ConnectionState.waiting;

                        if (isLoading) {
                          return WeatherLoading();
                        }

                        if (snapshot.hasError) {
                          return WeatherErrorWidget(
                            errorMessage: snapshot.error.toString(),
                          );
                        }

                        if (!snapshot.hasData) {
                          return EmptyWeatherWidget();
                        }

                        return WeatherResultView(weather: snapshot.data!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}
