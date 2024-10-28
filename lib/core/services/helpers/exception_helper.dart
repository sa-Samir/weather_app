import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../features/weather/data/models/weather_failure_model.dart';
import '../../infrastructure/data/data_state.dart';

class ExceptionHelper {
  static DataFailure handleDioException(
    DioException exception, {
    int? statusCode,
  }) {
    try {
      if (exception.type == DioExceptionType.connectionTimeout) {
        return const DataFailure(
          WeatherFailureErrorModel(
            message: 'Connection Timed Out!! Please Try Again.',
          ),
        );
      } else if (exception.type == DioExceptionType.receiveTimeout) {
        return const DataFailure(
          WeatherFailureErrorModel(
            message: 'Receive Time Out!! Please Try Again.',
          ),
        );
      } else if (exception.type == DioExceptionType.sendTimeout) {
        return const DataFailure(
          WeatherFailureErrorModel(
            message: 'Send Time Out!! Please Try Again.',
          ),
        );
      }
      final encodedResponse = json.encode(exception.response?.data);
      var errorResponse = weatherFailureModelFromJson(encodedResponse);
      return DataFailure(errorResponse.error);
    } catch (e) {
      return handleException(exception.response?.data);
    }
  }

  static DataFailure handleException(e) {
    return DataFailure(WeatherFailureErrorModel(message: e.toString()));
  }
}
