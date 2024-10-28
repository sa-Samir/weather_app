import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/services/dependencies/service_locator.dart';
import '../../../../../core/services/helpers/debouncer.dart';
import '../../../../../core/services/helpers/location_helper.dart';
import '../../../../../core/services/helpers/permission_helper.dart';
import '../../../../../core/services/helpers/validation_helper.dart';
import '../../../../weather/data/storage/weather_storage.dart';
import '../../provider/home_provider.dart';

class HomeInputSection extends StatefulWidget {
  const HomeInputSection({super.key});

  @override
  State<HomeInputSection> createState() => _HomeInputSectionState();
}

class _HomeInputSectionState extends State<HomeInputSection> {
  final _location = TextEditingController();

  bool get _isSave => _location.text.isEmpty;

  final _debouncer = Debouncer();

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  void dispose() {
    _location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _location,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your Location',
              prefixIcon: Icon(
                Icons.location_city,
                color: AppColors.primaryColor,
              ),
            ),
            onChanged: (value) =>
                _onLocationChanged(value, weatherStorage: sl<WeatherStorage>()),
            validator: ValidationHelper.checkEmptyField,
          ),
          Constants.sizedBoxMedium,
          _SaveUpdateButton(
            isSave: _isSave,
            location: _location,
          ),
        ],
      ),
    );
  }

  void _onLocationChanged(
    String value, {
    required WeatherStorage weatherStorage,
  }) {
    if (value.isNotEmpty) {
      _debouncer.run(() {
        weatherStorage.storeLocation(value);
        setState(() {});
      });
    }
  }

  void _initialize() {
    _populateLocation(weatherStorage: sl<WeatherStorage>());
    _checkLocationPermission(locationHelper: sl<LocationHelper>());
  }

  void _populateLocation({required WeatherStorage weatherStorage}) {
    _location.text = weatherStorage.getLocation ?? '';
  }

  void _checkLocationPermission({required LocationHelper locationHelper}) {
    if (_location.text.isEmpty) {
      PermissionHelper.checkLocationPermission(
        context,
        onGranted: () async {
          final locationData = await locationHelper.getLocation;
          _fetchLocationDataByCoordinates(locationData: locationData);
        },
      );
    }
  }

  void _fetchLocationDataByCoordinates({
    required LocationData locationData,
  }) async {
    if (mounted) {
      await context
          .read<HomeProvider>()
          .fetchCurrentWeatherByCoordinates(coordinates: locationData);
      if (mounted) {
        setState(() {
          _location.text =
              context.read<HomeProvider>().currentWeather?.location?.name ?? '';
        });
      }
    }
  }
}

class _SaveUpdateButton extends StatelessWidget {
  final bool isSave;
  final TextEditingController location;
  const _SaveUpdateButton({
    required this.isSave,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () =>
          _fetchLocationData(context, weatherStorage: sl<WeatherStorage>()),
      child: Text(isSave ? 'Save' : 'Update'),
    );
  }

  void _fetchLocationData(
    BuildContext context, {
    required WeatherStorage weatherStorage,
  }) {
    if (Form.of(context).validate()) {
      weatherStorage.storeLocation(location.text);
      context.read<HomeProvider>().fetchCurrentWeather(query: location.text);
    }
  }
}
