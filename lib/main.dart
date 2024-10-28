import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import 'config/routes/routes.dart';
import 'core/constants/constants.dart';
import 'core/services/dependencies/service_locator.dart';
import 'core/services/storage/help_storage.dart';
import 'features/my_app.dart';

void main() async {
  dotenv.load(fileName: Constants.envFile);
  await GetStorage.init();
  initializeDependencies();
  final showHelp = sl<HelpStorage>().showHelp;
  final initialRoute = showHelp ? Routes.help : Routes.home;
  runApp(
    MyApp(
      initialRoute: initialRoute,
    ),
  );
}
