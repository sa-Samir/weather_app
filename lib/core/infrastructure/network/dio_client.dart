import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../features/weather/data/models/weather_failure_model.dart';
import '../../../features/weather/data/models/weather_model.dart';
import '../../services/helpers/exception_helper.dart';
import '../data/data_state.dart';

class DioClient {
  final Dio dio;
  DioClient({required this.dio}) {
    dio.options.contentType = Headers.contentTypeHeader;
  }

  Future<DataState> get(
    String url,
  ) async {
    try {
      var response = await dio.get(
        url,
      );
      var encodedResponse = json.encode(response.data);
      if ((response.statusCode ?? 400) >= 200 &&
          (response.statusCode ?? 400) <= 299) {
        final successModel = weatherModelFromJson(encodedResponse);
        return DataSuccess(successModel);
      } else {
        final errorModel = weatherFailureModelFromJson(encodedResponse);
        return DataFailure(errorModel.error);
      }
    } on DioException catch (e) {
      return ExceptionHelper.handleDioException(e);
    } catch (e) {
      return ExceptionHelper.handleException(e);
    }
  }
}
