import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherUrls {
  static final String _baseUrl = dotenv.env['WEATHER_BASE_URL'] ?? '';
  static final String _apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';

  static String fetchCurrentWeather = '${_baseUrl}current.json?key=$_apiKey';
}
