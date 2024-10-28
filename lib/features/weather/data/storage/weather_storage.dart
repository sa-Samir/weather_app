import 'package:get_storage/get_storage.dart';

class WeatherStorage {
  final GetStorage storage;
  WeatherStorage({required this.storage});
  static const _locationKey = 'LOCATION';

  String? get getLocation {
    final storedLocation = storage.read(_locationKey);
    return storedLocation;
  }

  void storeLocation(String location) {
    storage.write(_locationKey, location.toString());
  }
}
