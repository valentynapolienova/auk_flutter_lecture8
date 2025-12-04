import 'package:flutter/material.dart';

class EmptyWeatherWidget extends StatelessWidget {
  const EmptyWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No data', style: TextStyle(color: Colors.white)),
    );
  }
}
