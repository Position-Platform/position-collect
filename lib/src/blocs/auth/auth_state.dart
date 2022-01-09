/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:00:55 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:00:55 
 */
part of 'auth_bloc.dart';

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

//Compte désactivé
class AuthDisableAccount extends AuthState {}

//Authetification Login
class AuthLoginState extends AuthState {}

//Authentification Register
class AuthRegisterState extends AuthState {}
