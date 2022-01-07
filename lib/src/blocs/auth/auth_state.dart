part of 'auth_bloc.dart';

/*
 * Created on Fri Jan 07 2022 by Boris Gautier
 *
 * Copyright (c) 2022 
 */

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// Etat initial de l'authentification
class AuthInitial extends AuthState {}

//authentification reussie
class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AuthSuccess { User: $user }';
}

//Etat qui gère la premiere ouverture de l'application
class AuthFirstOpen extends AuthState {}

//Echec d'authentification
class AuthFailure extends AuthState {}

//Authetification Login
class AuthLoginState extends AuthState {}

//Authentification Register
class AuthRegisterState extends AuthState {}
