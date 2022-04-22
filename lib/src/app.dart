// ignore_for_file: unused_import

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:52 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-10 13:34:26
 */
// ignore_for_file: file_names, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/blocs/home/home_bloc.dart';
import 'package:positioncollect/src/blocs/login/login_bloc.dart';
import 'package:positioncollect/src/blocs/theme/theme_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/views/homeScreen/home.dart';
import 'package:positioncollect/src/views/ladingScreen/lading.dart';
import 'package:positioncollect/src/views/loadingPage.dart';
import 'package:positioncollect/src/views/loginScreen/loginPage.dart';
import 'package:positioncollect/src/views/splashScreen/splash.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: "Position Collect",
            theme: state.themeData,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: const Locale('fr', 'FR'),
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: const LoadingPage(),
          );
        },
      ),
    );
  }
}
