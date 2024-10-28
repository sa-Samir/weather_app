import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/constants/enums.dart';
import '../../../../../core/constants/text_styles.dart';
import '../../../../weather/data/models/weather_model.dart';
import '../../provider/home_provider.dart';

class HomeWeatherComponent extends StatelessWidget {
  const HomeWeatherComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    if (homeProvider.status == Status.initial) {
      return const SizedBox();
    }
    if (homeProvider.status == Status.loading) {
      return const CircularProgressIndicator.adaptive();
    }
    if (homeProvider.status == Status.failure) {
      return Center(
        child: Text(
          homeProvider.errorMessage,
          style: TextStyles.regular12,
        ),
      );
    }
    return _WeatherTile(
      weather: homeProvider.currentWeather,
    );
  }
}

class _WeatherTile extends StatelessWidget {
  final WeatherModel? weather;
  const _WeatherTile({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.padding,
          vertical: Constants.padding * .5,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weather?.location?.name ?? '',
                    style: TextStyles.regular16,
                  ),
                  Constants.sizedBoxSmall,
                  _ConditionSection(
                    condition: weather?.current?.condition,
                  ),
                ],
              ),
            ),
            Constants.sizedBoxMediumWidth,
            _TemperatureComponent(
              temperature: weather?.current?.tempC,
            ),
          ],
        ),
      ),
    );
  }
}

class _ConditionSection extends StatelessWidget {
  final CurrentConditionModel? condition;
  const _ConditionSection({
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https:${condition?.icon}',
          height: Constants.smallIconSize,
          width: Constants.smallIconSize,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.error,
            size: Constants.smallIconSize,
          ),
        ),
        Constants.sizedBoxSmallWidth,
        Expanded(
          child: Text(
            condition?.text ?? '',
          ),
        ),
      ],
    );
  }
}

class _TemperatureComponent extends StatelessWidget {
  final num? temperature;
  const _TemperatureComponent({
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    if (temperature == null) {
      return const Align(
        child: Text(
          'N/A',
          style: TextStyles.regular18,
        ),
      );
    }
    return Align(
      child: Text(
        '$temperature °C',
        style: TextStyles.regular18,
      ),
    );
  }
}
