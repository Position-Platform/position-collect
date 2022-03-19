/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-10 13:22:08 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-10 13:50:46
 */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:positioncollect/src/utils/themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
          AppThemes.appThemeData[AppTheme.lightTheme],
        )) {
    on<ThemeEvent>((event, emit) {
      emit(ThemeState(AppThemes.appThemeData[event.appTheme]));
    });
  }
}
