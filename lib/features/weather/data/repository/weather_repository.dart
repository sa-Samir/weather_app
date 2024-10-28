import '../../../../core/infrastructure/data/data_state.dart';
import '../../../../core/infrastructure/network/dio_client.dart';
import '../urls/weather_urls.dart';

class WeatherRepository {
  final DioClient dioClient;
  WeatherRepository({required this.dioClient});

  Future<DataState> fetchCurrentWeather({required String query}) async {
    final response =
        await dioClient.get('${WeatherUrls.fetchCurrentWeather}&q=$query');
    return response;
  }
}
