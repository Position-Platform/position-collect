/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:00:47 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:00:47 
 */
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthFirst extends AuthEvent {}

class AuthLoggedIn extends AuthEvent {}

class AuthLoggedOut extends AuthEvent {}

class AuthLogin extends AuthEvent {}

class AuthRegister extends AuthEvent {}
