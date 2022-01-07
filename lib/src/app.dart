// ignore_for_file: file_names, avoid_print, use_key_in_widget_constructors

/*
 * Created on Fri Jan 07 2022 by Boris Gautier
 *
 * Copyright (c) 2022 
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Position Collect",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            //  return SplashScreen();
          }
          if (state is AuthFirstOpen) {
            //  return LadingPage();
          }
          if (state is AuthFailure) {
            /*  return BlocProvider<LoginBloc>(
              create: (context) => getIt<LoginBloc>(),
              child: LoginScreen(),
            );*/
          }
          if (state is AuthSuccess) {
            /* return BlocProvider<HomeBloc>(
              create: (context) => getIt<HomeBloc>(),
              child: HomePage(
                imageProfil: state.imageProfil,
              ),
            );*/
          }

          return Container();
        },
      ),
    );
  }
}
