/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 08:46:19 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-09 09:12:27
 */

part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool? isPhoneValid;
  final bool? isPasswordValid;
  final bool? isSubmitting;
  final bool? isSuccess;
  final bool? isFailure;
  final bool? isSend;
  final bool? isFailSend;
  final bool? isDisabledAccount;

  bool get isFormValid => isPhoneValid! && isPasswordValid!;

  const LoginState(
      {@required this.isPhoneValid,
      @required this.isPasswordValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.isSend,
      @required this.isFailSend,
      @required this.isDisabledAccount});

  factory LoginState.initial() {
    return const LoginState(
        isPhoneValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isDisabledAccount: false);
  }

  factory LoginState.send() {
    return const LoginState(
        isPhoneValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: true,
        isFailSend: false,
        isDisabledAccount: false);
  }

  factory LoginState.failSend() {
    return const LoginState(
        isPhoneValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: true,
        isDisabledAccount: false);
  }

  factory LoginState.loading() {
    return const LoginState(
        isPhoneValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isDisabledAccount: false);
  }

  factory LoginState.failure() {
    return const LoginState(
        isPhoneValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true,
        isSend: false,
        isFailSend: false,
        isDisabledAccount: false);
  }

  factory LoginState.success() {
    return const LoginState(
        isPhoneValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isDisabledAccount: false);
  }

  factory LoginState.disabledAccount() {
    return const LoginState(
        isPhoneValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isDisabledAccount: true);
  }

  LoginState update({
    bool? isPhoneValid,
    bool? isPasswordValid,
  }) {
    return copyWith(
        isPhoneValid: isPhoneValid,
        isPasswordValid: isPasswordValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isDisabledAccount: false);
  }

  LoginState copyWith(
      {bool? isPhoneValid,
      bool? isPasswordValid,
      bool? isSubmitEnabled,
      bool? isSubmitting,
      bool? isSuccess,
      bool? isFailure,
      bool? isSend,
      bool? isFailSend,
      bool? isDisabledAccount}) {
    return LoginState(
        isPhoneValid: isPhoneValid ?? this.isPhoneValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        isSend: isSend ?? this.isSend,
        isFailSend: isFailSend ?? this.isFailSend,
        isDisabledAccount: isDisabledAccount ?? this.isDisabledAccount);
  }

  @override
  String toString() {
    return '''LoginState {
      isPhoneValid: $isPhoneValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isSend: $isSend,
      isFailSend: $isFailSend,
      isDisabledAccount : $isDisabledAccount
    }''';
  }

  @override
  List<Object> get props => [
        isPhoneValid!,
        isPasswordValid!,
        isDisabledAccount!,
        isFailSend!,
        isSubmitting!,
        isSuccess!,
        isFailure!,
        isSend!
      ];
}
