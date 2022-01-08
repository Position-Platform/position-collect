// ignore_for_file: file_names, avoid_print, use_key_in_widget_constructors

/*
 * Created on Fri Jan 07 2022 by Boris Gautier
 *
 * Copyright (c) 2022 
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/views/ladingScreen/lading.dart';
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
            /* return BlocProvider<LoginBloc>(
              create: (context) => getIt<LoginBloc>(),
              child: LoginScreen(),
            );*/
            return Container();
          }
          if (state is AuthSuccess) {
            /*return BlocProvider<HomeBloc>(
              create: (context) => getIt<HomeBloc>(),
              child: HomePage(
                imageProfil: state.imageProfil,
              ),
            );*/
            return Container();
          }

          return SplashScreen();
        },
      ),
    );
  }
}
