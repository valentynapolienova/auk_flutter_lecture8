# lecture6

Fetch and display live weather data from OpenWeatherMap.

## Steps

1. Add `geolocator` and `geocoding` to dependencies. (https://pub.dev/packages/geolocator/install, https://pub.dev/packages/geocoding/install)
2. Create a Weather model. For this check out API docs called **API response** (https://openweathermap.org/current).
3. Create a Weather service. For this check out API docs called **Built-in API request by city name** (https://openweathermap.org/current)
4. Create a Location service.
5. Build UI with FutureBuilder.
6. Hide API key in env_dev.json file, add it to gitignore. Read the value using `String.fromEnvironment`. Now you can run the app with `flutter run --dart-define-from-file=env_dev.json`.
