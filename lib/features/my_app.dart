import 'package:flutter/material.dart';

import '../config/routes/app_router.dart';
import '../config/theme/themes.dart';
import '../core/constants/constants.dart';

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Themes.lightTheme,
      initialRoute: initialRoute,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
