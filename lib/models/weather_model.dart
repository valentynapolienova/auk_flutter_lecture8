class Weather {
  const Weather({
    required this.cityName,
    required this.temperatureC,
    required this.description,
  });

  final String cityName;
  final double temperatureC;
  final String description;

  factory Weather.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'] as String? ?? 'Unknown';
    final main = json['main'] as Map<String, dynamic>? ?? {};
    final weatherList = json['weather'] as List<dynamic>? ?? [];
    final weatherFirst = weatherList.isNotEmpty
        ? weatherList.first as Map<String, dynamic>
        : <String, dynamic>{};

    final temp = (main['temp'] as num?)?.toDouble() ?? 0.0;
    final desc = (weatherFirst['description'] as String? ?? 'No data')
        .toLowerCase();

    return Weather(cityName: cityName, temperatureC: temp, description: desc);
  }

  String get emoji {
    final d = description.toLowerCase();
    if (d.contains('storm') || d.contains('thunder')) return '⛈️';
    if (d.contains('rain') || d.contains('drizzle')) return '🌧️';
    if (d.contains('snow')) return '❄️';
    if (d.contains('cloud')) return '☁️';
    if (d.contains('mist') || d.contains('fog')) return '🌫️';
    return '☀️';
  }

  String get summaryText => '${_capitalise(description)} in $cityName';

  String _capitalise(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
