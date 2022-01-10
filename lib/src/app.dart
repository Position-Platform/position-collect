/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:52 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-09 15:41:16
 */
// ignore_for_file: file_names, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/blocs/home/home_bloc.dart';
import 'package:positioncollect/src/blocs/login/login_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/views/homeScreen/home.dart';
import 'package:positioncollect/src/views/ladingScreen/lading.dart';
import 'package:positioncollect/src/views/loginScreen/loginPage.dart';
import 'package:positioncollect/src/views/splashScreen/splash.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Position Collect",
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            return SplashScreen();
          }
          if (state is AuthFirstOpen) {
            return LadingPage();
          }
          if (state is AuthFailure) {
            return BlocProvider<LoginBloc>(
              create: (context) => getIt<LoginBloc>(),
              child: LoginPage(),
            );
          }
          if (state is AuthSuccess) {
            return BlocProvider<HomeBloc>(
              create: (context) => getIt<HomeBloc>(),
              child: HomePage(
                user: state.user,
              ),
            );
          }

          return SplashScreen();
        },
      ),
    );
  }
}
