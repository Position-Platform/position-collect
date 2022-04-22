/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:00:41 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-22 18:46:16
 */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/repositories/auth/authRepository.dart';
import 'package:positioncollect/src/utils/result.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository? authRepository;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  AuthBloc({this.authRepository, this.sharedPreferencesHelper})
      : super(AuthInitial()) {
    on<AuthStarted>(_authStarted);
    on<AuthLoggedIn>(_authLoggedIn);
    on<AuthFirst>(_authFirstOpen);
    on<AuthLoggedOut>(_authLoggedOut);
    on<AuthLogin>(_authLogin);
  }

  //Initialisation du processus d'authentification
  void _authStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    final isSignedIn = await authRepository!.hasToken();
    final firstOpen = await sharedPreferencesHelper!.getIsFirstOpen();
    final token = await sharedPreferencesHelper!.getToken();

    if (firstOpen == "oui") {
      return emit(AuthFirstOpen());
    } else {
      if (isSignedIn) {
        try {
          final userResult = await authRepository!.getuser(token!);
          if (userResult.error is NoInternetError) {
            return emit(AuthNoInternet());
          } else if (userResult.error is ServerError) {
            return emit(AuthFailure());
          } else {
            if (userResult.success!.data!.user!.commercial!.actif!) {
              return emit(AuthSuccess(userResult.success!.data!.user!));
            } else {
              return emit(AuthDisableAccount());
            }
          }
        } catch (e) {
          return emit(AuthServerError());
        }
      } else {
        return emit(AuthFailure());
      }
    }
  }

//Verifier si l'utilisateur est deja connecté
  void _authLoggedIn(
    AuthLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final firstOpen = await sharedPreferencesHelper!.getIsFirstOpen();
    final token = await sharedPreferencesHelper!.getToken();
    if (firstOpen == "oui") {
      return emit(AuthFirstOpen());
    } else {
      try {
        final userResult = await authRepository!.getuser(token!);
        if (userResult.error is NoInternetError) {
          return emit(AuthNoInternet());
        } else if (userResult.error is ServerError) {
          return emit(AuthServerError());
        } else {
          if (userResult.success!.data!.user!.commercial!.actif!) {
            return emit(AuthSuccess(userResult.success!.data!.user!));
          } else {
            return emit(AuthDisableAccount());
          }
        }
      } catch (e) {
        return emit(AuthServerError());
      }
    }
  }

// première connection de l'utilisateur
  void _authFirstOpen(
    AuthFirst event,
    Emitter<AuthState> emit,
  ) async {
    await sharedPreferencesHelper!.setIsFirstOpen("non");
    return emit(AuthFailure());
  }

// Deconnexion de l'utilisateur
  void _authLoggedOut(
    AuthLoggedOut event,
    Emitter<AuthState> emit,
  ) async {
    final token = await sharedPreferencesHelper!.getToken();
    authRepository!.logout(token!);
    await sharedPreferencesHelper!.deleteToken();
    return emit(AuthFailure());
  }

// Redirection vers la LoginPage
  void _authLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    return emit(AuthLoginState());
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
