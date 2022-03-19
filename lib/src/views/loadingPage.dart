// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 20:24:32 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-20 20:32:35
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/blocs/gps/gps_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/views/gpsAccessPage.dart';
import 'package:positioncollect/src/views/initPage.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
              ? BlocProvider<AuthBloc>(
                  create: (context) => getIt<AuthBloc>()..add(AuthStarted()),
                  child: const InitPage(),
                )
              : const GpsAccessPage();
        },
      ),
    );
  }
}
