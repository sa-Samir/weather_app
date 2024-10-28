import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/dependencies/service_locator.dart';
import '../../features/help/presentation/page/help_screen.dart';
import '../../features/home/presentation/page/home_screen.dart';
import '../../features/home/presentation/provider/home_provider.dart';
import '../../features/weather/data/repository/weather_repository.dart';
import 'routes.dart';

class AppRouter {
  final Route? initialRoute;

  AppRouter({
    this.initialRoute,
  });

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return initialRoute;

      case Routes.help:
        return MaterialPageRoute(
          builder: (_) => const HelpScreen(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) =>
                HomeProvider(weatherRepository: sl<WeatherRepository>()),
            child: const HomeScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
