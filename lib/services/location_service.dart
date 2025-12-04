import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check location services.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check permissions.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied. Please enable them in Settings.',
      );
    }

    // Get current position.
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.low,
    );
    return Geolocator.getCurrentPosition(locationSettings: locationSettings);
  }

  /// Returns the current city name (e.g. "Kyiv") based on device location.
  Future<String> getCurrentCity() async {
    try {
      final position = await _getCurrentPosition();

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) {
        throw Exception('Could not determine city from your location.');
      }

      final place = placemarks.first;

      final city = place.locality ?? place.administrativeArea ?? place.country;

      if (city == null || city.isEmpty) {
        throw Exception('City name is not available for this location.');
      }

      return city;
    } catch (e) {
      rethrow;
    }
  }
}
