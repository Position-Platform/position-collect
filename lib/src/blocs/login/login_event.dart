/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 08:46:05 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-09 15:23:55
 */
part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneChanged extends LoginEvent {
  final String? phone;

  const LoginPhoneChanged({@required this.phone});

  @override
  List<Object> get props => [phone!];

  @override
  String toString() => 'LoginPhoneChanged { phone :$phone }';
}

class LoginPasswordChanged extends LoginEvent {
  final String? password;

  const LoginPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password!];

  @override
  String toString() => 'LoginPasswordChanged { password: $password }';
}

class PasswordForgot extends LoginEvent {
  final String? email;

  const PasswordForgot({@required this.email});

  @override
  List<Object> get props => [email!];

  @override
  String toString() => 'PasswordReset { email :$email }';
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String? phone;
  final String? password;

  const LoginWithCredentialsPressed({
    @required this.phone,
    @required this.password,
  });

  @override
  List<Object> get props => [phone!, password!];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { phone: $phone, password: $password }';
  }
}
