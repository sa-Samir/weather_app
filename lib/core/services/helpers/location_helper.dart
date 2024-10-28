import 'package:location/location.dart';

class LocationHelper {
  final Location location;
  LocationHelper({required this.location});

  Future<LocationData> get getLocation async => await location.getLocation();
}
