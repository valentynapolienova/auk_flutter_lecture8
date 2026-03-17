import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  /// Gets the current city name based on the user's location.
  Future<String> getCurrentCity() async {
    // Check location services.
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw Exception('Location services are disabled.');
    }

    // Check permissions.
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied.');
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied. Please enable them in Settings.');
    }

    // Get current position.
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.low),
    );

    // Reverse geocode to get city name.
    final placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isEmpty) throw Exception('Could not determine city from your location.');

    final city = placemarks.first.locality ?? placemarks.first.administrativeArea ?? placemarks.first.country;
    if (city == null || city.isEmpty) throw Exception('City name is not available for this location.');

    return city;
  }
}
