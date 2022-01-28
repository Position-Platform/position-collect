/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:58 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 01:39:23
 */
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/simpleBlocObserver.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/position/batiments/batimentsApiServiceFactory.dart';
import 'package:positioncollect/src/app.dart';
import 'package:positioncollect/src/blocs/gps/gps_bloc.dart';
import 'package:positioncollect/src/database/database.dart';

import 'package:positioncollect/src/di/di.dart' as di;
import 'package:path_provider/path_provider.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/batiments_model/batiments_model.dart';
import 'package:positioncollect/src/repositories/position/batiments/batimentsRepositoryImpl.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
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
  final batimentsDao = AppDatabase().batimentsDao;
  final networkHelper = NetworkInfoHelper();
  final sharedPreferences = SharedPreferencesHelper();

  final batimentsRepository = BatimentsRepositoryImpl(
      batimentsApiService: batimentsApiService,
      batimentsDao: batimentsDao,
      networkInfoHelper: networkHelper,
      sharedPreferencesHelper: sharedPreferences);

  Workmanager().executeTask((task, inputData) async {
    Fluttertoast.showToast(
        msg: "Get data",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: greyColor,
        textColor: whiteColor,
        fontSize: 16.0);

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

      Fluttertoast.showToast(
          msg: "Data Update",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: greyColor,
          textColor: whiteColor,
          fontSize: 16.0);
    }

    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationSupportDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () {},
    storage: storage,
  );
  BlocOverrides.runZoned(
    () {
      di.getIt<GpsBloc>();
    },
    blocObserver: SimpleBlocObserver(),
  );
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerPeriodicTask("1", "updatebatiments",
      frequency: const Duration(hours: 1),
      constraints: Constraints(
          networkType: NetworkType.connected, requiresStorageNotLow: true));
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => di.getIt<GpsBloc>()),
      //  BlocProvider(create: (_) => di.getIt<AuthBloc>()..add(AuthStarted()))
    ], child: MyApp()),
  );
}
