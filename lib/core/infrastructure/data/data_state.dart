import '../../../features/weather/data/models/weather_failure_model.dart';
import '../../../features/weather/data/models/weather_model.dart';

abstract class DataState {
  final WeatherModel? data;
  final WeatherFailureErrorModel? error;

  const DataState({this.data, this.error});
}

class DataSuccess extends DataState {
  const DataSuccess(WeatherModel? data) : super(data: data);
}

class DataFailure extends DataState {
  const DataFailure(WeatherFailureErrorModel? error) : super(error: error);
}
