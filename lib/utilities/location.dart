import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? lattitude;
  Future<void> getlocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    lattitude = position.latitude;
    longitude = position.longitude;
  }
}
