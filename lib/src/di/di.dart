/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:01:23 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-10 13:52:24
 */
// ignore_for_file: file_names, avoid_print

import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/auth/authApiService.dart';
import 'package:positioncollect/src/api/auth/authApiServiceFactory.dart';
import 'package:positioncollect/src/api/batiments/batimentsApiService.dart';
import 'package:positioncollect/src/api/batiments/batimentsApiServiceFactory.dart';
import 'package:positioncollect/src/api/etablissements/etablissementsApiService.dart';
import 'package:positioncollect/src/api/etablissements/etablissementsApiServiceFactory.dart';
import 'package:positioncollect/src/api/nominatim/nominatimApiService.dart';
import 'package:positioncollect/src/api/nominatim/nominatimApiServiceFactory.dart';
import 'package:positioncollect/src/api/nominatimService.dart';
import 'package:positioncollect/src/api/tracking/trackingApiService.dart';
import 'package:positioncollect/src/api/tracking/trackingApiServiceFactory.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/blocs/gps/gps_bloc.dart';
import 'package:positioncollect/src/blocs/home/home_bloc.dart';
import 'package:positioncollect/src/blocs/login/login_bloc.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/blocs/theme/theme_bloc.dart';
import 'package:positioncollect/src/database/batiments/batimentDao.dart';
import 'package:positioncollect/src/database/database.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/repositories/auth/authRepository.dart';
import 'package:positioncollect/src/repositories/auth/authRepositoryImpl.dart';
import 'package:positioncollect/src/repositories/batiments/batimentsRepository.dart';
import 'package:positioncollect/src/repositories/batiments/batimentsRepositoryImpl.dart';
import 'package:positioncollect/src/repositories/etablissements/etablissementsRepository.dart';
import 'package:positioncollect/src/repositories/etablissements/etablissementsRepositoryImpl.dart';
import 'package:positioncollect/src/repositories/nominatim/nominatimRepository.dart';
import 'package:positioncollect/src/repositories/nominatim/nominatimRepositoryImpl.dart';
import 'package:positioncollect/src/repositories/tracking/trackingRepository.dart';
import 'package:positioncollect/src/repositories/tracking/trackingRepositoryImpl.dart';
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

  final chopperNomonatim = ChopperClient(
    baseUrl: nominatimUrl,
    services: [
      // the generated service
      NominatimService.create()
    ],
    converter: const JsonConverter(),
  );

  final apiService = ApiService.create(chopper);
  final nominatimApiService = NominatimService.create(chopperNomonatim);

  //ApiService
  getIt.registerLazySingleton<AuthApiService>(
      () => AuthApiServiceFactory(apiService: apiService));
  getIt.registerLazySingleton<TrackingApiService>(
      () => TrackingApiServiceFactory(apiService: apiService));
  getIt.registerLazySingleton<BatimentsApiService>(
      () => BatimentsApiServiceFactory(apiService: apiService));
  getIt.registerLazySingleton<EtablissementsApiService>(
      () => EtablissementsApiServiceFactory(apiService: apiService));
  getIt.registerLazySingleton<NominatimApiService>(
      () => NominatimApiServiceFactory(nominatimService: nominatimApiService));

  //DataBase
  getIt.registerLazySingleton<BatimentsDao>(() => AppDatabase().batimentsDao);

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

  getIt.registerFactory<TrackingRepository>(
    () => TrackingRepositoryImpl(
      trackingApiService: getIt(),
      networkInfoHelper: getIt(),
      sharedPreferencesHelper: getIt(),
    ),
  );

  getIt.registerFactory<BatimentsRepository>(
    () => BatimentsRepositoryImpl(
        batimentsApiService: getIt(),
        networkInfoHelper: getIt(),
        sharedPreferencesHelper: getIt(),
        batimentsDao: getIt()),
  );

  getIt.registerFactory<EtablissementsRepository>(
    () => EtablissementsRepositoryImpl(
        etablissementsApiService: getIt(),
        networkInfoHelper: getIt(),
        sharedPreferencesHelper: getIt()),
  );

  getIt.registerFactory<NominatimRepository>(
    () => NominatimRepositoryImpl(
        nominatimApiService: getIt(),
        networkInfoHelper: getIt(),
        sharedPreferencesHelper: getIt()),
  );
  //Bloc
  getIt.registerFactory<AuthBloc>(() =>
      AuthBloc(authRepository: getIt(), sharedPreferencesHelper: getIt()));
  getIt.registerFactory<LoginBloc>(() =>
      LoginBloc(authRepository: getIt(), sharedPreferencesHelper: getIt()));
  getIt.registerFactory<HomeBloc>(() => HomeBloc(trackingRepository: getIt()));
  getIt.registerFactory<GpsBloc>(() => GpsBloc());
  getIt.registerFactory<MapBloc>(() => MapBloc(
      batimentsRepository: getIt(),
      etablissementsRepository: getIt(),
      trackingRepository: getIt(),
      nominatimRepository: getIt()));
  getIt.registerFactory<NewBusinessBloc>(() => NewBusinessBloc());

  getIt.registerFactory<ThemeBloc>(() => ThemeBloc());
}
