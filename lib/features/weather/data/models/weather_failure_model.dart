import 'dart:convert';

import '../../../../core/constants/type_defs.dart';

WeatherFailureModel weatherFailureModelFromJson(String? data) =>
    WeatherFailureModel.fromJson(json.decode(data ?? ''));

class WeatherFailureModel {
  final WeatherFailureErrorModel? error;

  const WeatherFailureModel({
    required this.error,
  });

  factory WeatherFailureModel.fromJson(JsonMap json) => WeatherFailureModel(
        error: json['error'] != null
            ? WeatherFailureErrorModel.fromJson(json['error'])
            : null,
      );
}

class WeatherFailureErrorModel {
  final String? message;

  const WeatherFailureErrorModel({
    required this.message,
  });

  factory WeatherFailureErrorModel.fromJson(JsonMap json) =>
      WeatherFailureErrorModel(
        message: json['message']?.toString(),
      );
}
