import 'dart:convert';

import '../../../../core/constants/type_defs.dart';

WeatherModel weatherModelFromJson(String? data) =>
    WeatherModel.fromJson(json.decode(data ?? ''));

class WeatherModel {
  final WeatherLocationModel? location;
  final WeatherCurrentModel? current;
  WeatherModel({
    required this.location,
    required this.current,
  });

  factory WeatherModel.fromJson(JsonMap json) => WeatherModel(
        location: json['location'] != null
            ? WeatherLocationModel.fromJson(json['location'])
            : null,
        current: json['current'] != null
            ? WeatherCurrentModel.fromJson(json['current'])
            : null,
      );
}

class WeatherLocationModel {
  final String? name;

  WeatherLocationModel({
    required this.name,
  });

  factory WeatherLocationModel.fromJson(JsonMap json) => WeatherLocationModel(
        name: json['name']?.toString(),
      );
}

class WeatherCurrentModel {
  final num? tempC;
  final CurrentConditionModel? condition;

  WeatherCurrentModel({
    required this.tempC,
    required this.condition,
  });

  factory WeatherCurrentModel.fromJson(JsonMap json) => WeatherCurrentModel(
        tempC: json['temp_c'],
        condition: json['condition'] != null
            ? CurrentConditionModel.fromJson(json['condition'])
            : null,
      );
}

class CurrentConditionModel {
  final String? text;
  final String? icon;
  CurrentConditionModel({
    required this.text,
    required this.icon,
  });

  factory CurrentConditionModel.fromJson(JsonMap json) => CurrentConditionModel(
        text: json['text']?.toString(),
        icon: json['icon']?.toString(),
      );
}
