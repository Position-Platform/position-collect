/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:01:23 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:01:23 
 */
// ignore_for_file: file_names, avoid_print

import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/auth/authApiService.dart';
import 'package:positioncollect/src/api/auth/authApiServiceFactory.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/repositories/auth/authRepository.dart';
import 'package:positioncollect/src/repositories/auth/authRepositoryImpl.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/helpers/network.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  final chopper = ChopperClient(
    baseUrl: apiUrl,
    services: [
      // the generated service
      ApiService.create()
    ],
    converter: const JsonConverter(),
  );

  final apiService = ApiService.create(chopper);

  //ApiService
  getIt.registerLazySingleton<AuthApiService>(
      () => AuthApiServiceFactory(apiService: apiService));

  //Utils
  getIt.registerLazySingleton<NetworkInfoHelper>(() => NetworkInfoHelper());
  getIt.registerLazySingleton<SharedPreferencesHelper>(
      () => SharedPreferencesHelper());

  //Repository
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      authApiService: getIt(),
      networkInfoHelper: getIt(),
      sharedPreferencesHelper: getIt(),
    ),
  );

  //Bloc
  getIt.registerFactory<AuthBloc>(() =>
      AuthBloc(authRepository: getIt(), sharedPreferencesHelper: getIt()));
}
