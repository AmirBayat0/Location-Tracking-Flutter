import 'package:geolocator/geolocator.dart'; // Handles location services
import 'package:geocoding/geocoding.dart'; // Converts coordinates to human-readable addresses

/// A helper class for handling location services
class LocationHelper {
  /// Requests location permission and retrieves the user's location along with city & country details.
  Future<Map<String, dynamic>?> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // ✅ Step 1: Check if location services are enabled on the device
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null; // If location services are off, return null
    }

    // ✅ Step 2: Check the current location permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // If permission is denied, request it again
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null; // If denied again, return null
      }
    }

    // ✅ Step 3: Check if the user has permanently denied location access
    if (permission == LocationPermission.deniedForever) {
      return null; // Cannot proceed without location permissions
    }

    try {
      // ✅ Step 4: Get the user's current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy:
            LocationAccuracy.high, // Request high accuracy for better results
      );

      // ✅ Step 5: Convert latitude & longitude to an address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // ✅ Step 6: Extract city and country details from the retrieved placemarks
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first; // Use the first result
        return {
          'latitude': position.latitude, // User's latitude
          'longitude': position.longitude, // User's longitude
          'city': place.locality ?? 'Unknown', // City name (if available)
          'country': place.country ?? 'Unknown', // Country name (if available)
          'address':
              '${place.street}, ${place.locality}, ${place.country}', // Full address
        };
      }
      return null; // If no placemark data is found, return null
    } catch (e) {
      print('Error getting location: $e'); // Handle any errors that occur
      return null;
    }
  }
}
