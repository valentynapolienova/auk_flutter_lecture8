# lecture6

Fetch and display live weather data from OpenWeatherMap.

## Steps

1. Add `geolocator` and `geocoding` to dependencies. (https://pub.dev/packages/geolocator/install, https://pub.dev/packages/geocoding/install)
2. Create a Weather model. For this check out API docs called **API response** (https://openweathermap.org/current).
3. Create a Weather service. For this check out API docs called **Built-in API request by city name** (https://openweathermap.org/current)
4. Create a Location service.
5. Build UI with FutureBuilder. Apply your API key (https://home.openweathermap.org/api_keys)
6. Hide API key in env_dev.json file, add it to gitignore. Read the value using `String.fromEnvironment`. Now you can run the app with `flutter run --dart-define-from-file=env_dev.json`.

<table>
  <tr>
    <td valign="top" align="left">
      <img
        width="256"
        height="256"
        alt="icon"
        src="https://github.com/user-attachments/assets/b69562c1-dca7-4223-9a5f-978476643396"
      />
    </td>
    <td valign="top" align="left">
      <img
        width="300"
        height="800"
        alt="Simulator Screenshot - iPhone 16 Pro - 2025-11-07 at 14 49 29"
        src="https://github.com/user-attachments/assets/719cf20d-e06c-4835-bcf7-d020b14e99ce"
      />
    </td>
  </tr>
</table>
