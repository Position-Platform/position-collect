/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:58 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-21 15:04:37
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/src/app.dart';
import 'package:positioncollect/src/blocs/gps/gps_bloc.dart';
import 'package:positioncollect/src/core/app_environment.dart';
import 'package:positioncollect/src/core/init.dart';
import 'package:positioncollect/src/di/di.dart' as di;

void main() {
  initApp(
    builder: () => BlocProvider(
      create: (_) => di.getIt<GpsBloc>(),
      child: MyApp(),
    ),
    env: AppEnvironment.dev,
  );
}
