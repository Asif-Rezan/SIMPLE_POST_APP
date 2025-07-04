import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../cors/services/remote/api_service.dart';
import '../presentation/viewmodels/home/home_viewmodel.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Register Core Services
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Register Dio as a singleton
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Register ViewModels
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel());




}