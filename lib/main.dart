/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:58 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-20 20:32:56
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:positioncollect/simpleBlocObserver.dart';
import 'package:positioncollect/src/app.dart';
import 'package:positioncollect/src/blocs/gps/gps_bloc.dart';

import 'package:positioncollect/src/di/di.dart' as di;
import 'package:path_provider/path_provider.dart';

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
    () {},
    blocObserver: SimpleBlocObserver(),
  );
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => di.getIt<GpsBloc>()),
      //  BlocProvider(create: (_) => di.getIt<AuthBloc>()..add(AuthStarted()))
    ], child: MyApp()),
  );
}
