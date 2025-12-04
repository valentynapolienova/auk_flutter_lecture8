import 'package:flutter/material.dart';

class WeatherErrorWidget extends StatelessWidget {
  const WeatherErrorWidget({required this.errorMessage, super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}
