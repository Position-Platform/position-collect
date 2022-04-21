/*
 * @Author: Boris Gautier 
 * @Date: 2022-04-21 15:04:20 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-04-21 15:04:20 
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
    env: AppEnvironment.staging,
  );
}
