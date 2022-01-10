/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 08:47:12 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-09 15:24:24
 */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/user_model/user_model.dart';
import 'package:positioncollect/src/repositories/auth/authRepositoryImpl.dart';
import 'package:positioncollect/src/utils/result.dart';
import 'package:positioncollect/src/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository? authRepository;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  LoginBloc({
    this.authRepository,
    this.sharedPreferencesHelper,
  }) : super(LoginState.initial()) {
    on<LoginPhoneChanged>(_loginPhoneChanged,
        transformer: debounce(const Duration(milliseconds: 300)));
    on<LoginPasswordChanged>(_loginPasswordChanged,
        transformer: debounce(const Duration(milliseconds: 300)));
    on<LoginWithCredentialsPressed>(_loginButtonPressed);
    on<PasswordReset>(_resetButtonPressed);
  }

// RxDart pour gerer les evenements de facon asynchrone
  EventTransformer<LoginEvent> debounce<LoginEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  // Action de validation d'email qui s'effectue a chaque saisie de l'utilisateur
  void _loginPhoneChanged(
    LoginPhoneChanged event,
    Emitter<LoginState> emit,
  ) async {
    return emit(state.update(
      isPhoneValid: Validators.isValidTelephone(event.phone!),
    ));
  }

// Action de validation de mot de passe qui s'effectue a chaque saisie de l'utilisateur
  void _loginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    return emit(state.update(
      isPasswordValid: Validators.isValidPassword(event.password!),
    ));
  }

// Methode qui s'execute lors du clic sur le boutton connexion
  void _loginButtonPressed(
    LoginWithCredentialsPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginState.loading());
    try {
      Result<UserModel> user =
          await authRepository!.login(event.phone!, event.password!);
      if (user.success!.success!) {
        await sharedPreferencesHelper!.setToken(user.success!.data!.token!);
        return emit(LoginState.success());
      } else {
        return emit(LoginState.failure());
      }
    } catch (_) {
      return emit(LoginState.failure());
    }
  }

  void _resetButtonPressed(
    PasswordReset event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginState.loading());
    try {
      await authRepository!.forgotpassword(event.email!);
      return emit(LoginState.send());
    } catch (_) {
      return emit(LoginState.failSend());
    }
  }
}
