// ignore_for_file: avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-04-21 14:30:36 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-21 14:30:56
 */
import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:positioncollect/src/core/app_environment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:positioncollect/simpleBlocObserver.dart';

import 'package:positioncollect/src/di/di.dart' as di;
import 'package:path_provider/path_provider.dart';
import 'package:positioncollect/src/utils/config.dart';

import 'package:positioncollect/src/utils/workmanager.dart';
import 'package:workmanager/workmanager.dart';

Future<void> initApp({
  required FutureOr<Widget> Function() builder,
  required AppEnvironment env,
}) async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Configs.init(env: env);
    await di.init();
    final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationSupportDirectory(),
    );
    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    Workmanager().registerPeriodicTask("1", "updatebatiments",
        frequency: const Duration(minutes: 45),
        constraints: Constraints(
            requiresBatteryNotLow: true,
            networkType: NetworkType.connected,
            requiresStorageNotLow: true));
    Workmanager().registerPeriodicTask("2", "addtracking",
        frequency: const Duration(minutes: 15),
        constraints: Constraints(networkType: NetworkType.connected));

    HydratedBlocOverrides.runZoned(() async {
      runApp(await builder());
    }, storage: storage, blocObserver: SimpleBlocObserver());
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    print(stackTrace);
    print(error);
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
