/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 12:26:26 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 12:27:25
 */
import 'package:positioncollect/src/api/batiments/batimentsApiServiceFactory.dart';
import 'package:positioncollect/src/api/tracking/trackingApiServiceFactory.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/batiments_model/batiments_model.dart';
import 'package:positioncollect/src/repositories/batiments/batimentsRepositoryImpl.dart';
import 'package:positioncollect/src/repositories/tracking/trackingRepositoryImpl.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:chopper/chopper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/database/database.dart';
import 'package:positioncollect/src/utils/geolocator.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  final chopper = ChopperClient(
    baseUrl: apiUrl,
    services: [
      // the generated service
      ApiService.create()
    ],
    converter: const JsonConverter(),
  );
  final apiService = ApiService.create(chopper);
  final batimentsApiService =
      BatimentsApiServiceFactory(apiService: apiService);
  final trackingApiService = TrackingApiServiceFactory(apiService: apiService);
  final batimentsDao = AppDatabase().batimentsDao;
  final networkHelper = NetworkInfoHelper();
  final sharedPreferences = SharedPreferencesHelper();

  final batimentsRepository = BatimentsRepositoryImpl(
      batimentsApiService: batimentsApiService,
      batimentsDao: batimentsDao,
      networkInfoHelper: networkHelper,
      sharedPreferencesHelper: sharedPreferences);
  final trackingRepository = TrackingRepositoryImpl(
      networkInfoHelper: networkHelper,
      sharedPreferencesHelper: sharedPreferences,
      trackingApiService: trackingApiService);

  Workmanager().executeTask((task, inputData) async {
    if (task == "updatebatiments") {
      var batimentsBD = await batimentsDao.getBatiments();
      var numberBatimentsBD = batimentsBD.length;
      var batimentsApi = await batimentsRepository.getBatimentsNumber();
      var numberBatimentApi = int.parse(batimentsApi.success!.data!);

      if (numberBatimentApi >= numberBatimentsBD) {
        var response = await batimentsApiService.getBatiments();

        var model = BatimentsModel.fromJson(response.body);

        for (var i = 0; i < model.data!.length; i++) {
          BatimentsCompanion batimentsCompanion = BatimentsCompanion(
              id: Value(model.data![i].id!),
              batiment: Value(model.data![i]),
              online: const Value(true));

          await batimentsDao.insertBatiment(batimentsCompanion);
        }
      }

      return Future.value(true);
    } else {
      Position position = await determinePosition();
      await trackingRepository.addtracking(
          position.longitude.toString(), position.latitude.toString());
      return Future.value(true);
    }
  });
}
