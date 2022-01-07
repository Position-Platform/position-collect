import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:positioncollect/simpleBlocObserver.dart';
import 'package:positioncollect/src/app.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';

import 'package:positioncollect/src/di/di.dart' as di;
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationSupportDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () {},
    storage: storage,
  );
  BlocOverrides.runZoned(
    () {
      AuthBloc()
        ..add(AuthStarted())
        ..close();
    },
    blocObserver: SimpleBlocObserver(),
  );
  await di.init();

  runApp(BlocProvider(
      create: (_) => di.getIt<AuthBloc>()..add(AuthStarted()), child: MyApp()));
}
