import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';

import '../../../features/weather/data/repository/weather_repository.dart';
import '../../../features/weather/data/storage/weather_storage.dart';
import '../../infrastructure/network/dio_client.dart';
import '../helpers/location_helper.dart';
import '../storage/help_storage.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  sl.registerSingleton(GetStorage());
  sl.registerSingleton(HelpStorage(storage: sl<GetStorage>()));
  sl.registerSingleton(WeatherStorage(storage: sl<GetStorage>()));

  sl.registerSingleton(Location());
  sl.registerSingleton(LocationHelper(location: sl<Location>()));

  sl.registerSingleton(Dio());
  sl.registerSingleton(DioClient(dio: sl<Dio>()));

  sl.registerSingleton(WeatherRepository(dioClient: sl<DioClient>()));
}
