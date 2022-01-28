/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:58 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 12:27:37
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:positioncollect/simpleBlocObserver.dart';
import 'package:positioncollect/src/app.dart';
import 'package:positioncollect/src/blocs/gps/gps_bloc.dart';

import 'package:positioncollect/src/di/di.dart' as di;
import 'package:path_provider/path_provider.dart';

import 'package:positioncollect/src/utils/workmanager.dart';
import 'package:workmanager/workmanager.dart';

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
  Workmanager().registerPeriodicTask("2", "addtracking",
      frequency: const Duration(minutes: 15),
      constraints: Constraints(networkType: NetworkType.connected));
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => di.getIt<GpsBloc>()),
      //  BlocProvider(create: (_) => di.getIt<AuthBloc>()..add(AuthStarted()))
    ], child: MyApp()),
  );
}
