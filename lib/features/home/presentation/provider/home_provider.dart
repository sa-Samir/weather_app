import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/infrastructure/data/data_state.dart';
import '../../../weather/data/models/weather_model.dart';
import '../../../weather/data/repository/weather_repository.dart';

class HomeProvider extends ChangeNotifier {
  final WeatherRepository weatherRepository;
  HomeProvider({
    required this.weatherRepository,
  });

  Status _status = Status.initial;
  Status get status => _status;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  WeatherModel? _currentWeather;
  WeatherModel? get currentWeather => _currentWeather;

  Future fetchCurrentWeather({required String query}) async {
    if (_status != Status.loading) {
      _status = Status.loading;
      _errorMessage = '';
      notifyListeners();
      final response =
          await weatherRepository.fetchCurrentWeather(query: query);
      if (response is DataSuccess) {
        _status = Status.success;
        _currentWeather = response.data;
      } else {
        _status = Status.failure;
        _errorMessage = response.error?.message ?? '';
      }
      notifyListeners();
    }
  }

  Future fetchCurrentWeatherByCoordinates({
    required LocationData coordinates,
  }) async {
    final query = '${coordinates.latitude},${coordinates.longitude}';
    await fetchCurrentWeather(query: query);
  }
}
