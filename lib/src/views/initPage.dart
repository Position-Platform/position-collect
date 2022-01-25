// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 20:25:36 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-20 20:25:36 
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/blocs/home/home_bloc.dart';
import 'package:positioncollect/src/blocs/login/login_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/views/homeScreen/home.dart';
import 'package:positioncollect/src/views/ladingScreen/lading.dart';
import 'package:positioncollect/src/views/loginScreen/loginPage.dart';
import 'package:positioncollect/src/views/splashScreen/splash.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
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
    );
  }
}
