import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import 'components/home_input_section.dart';
import 'components/home_weather_component.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(Constants.padding),
      child: Column(
        children: [
          Text(
            'How\'s the weather? Tell us your location and we\'ll give you the details',
          ),
          Constants.sizedBoxMedium,
          HomeInputSection(),
          Constants.sizedBoxLarge,
          HomeWeatherComponent(),
        ],
      ),
    );
  }
}
