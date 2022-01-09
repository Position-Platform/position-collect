// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Position Collect`
  String get appname {
    return Intl.message(
      'Position Collect',
      name: 'appname',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Go ahead`
  String get go {
    return Intl.message(
      'Go ahead',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed`
  String get loginFailed {
    return Intl.message(
      'Login Failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Connection...`
  String get loggin {
    return Intl.message(
      'Connection...',
      name: 'loggin',
      desc: '',
      args: [],
    );
  }

  /// `A reset email has been sent to you`
  String get emailSend {
    return Intl.message(
      'A reset email has been sent to you',
      name: 'emailSend',
      desc: '',
      args: [],
    );
  }

  /// `Email error. Try again!!!`
  String get emailNoSend {
    return Intl.message(
      'Email error. Try again!!!',
      name: 'emailNoSend',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccess {
    return Intl.message(
      'Login successful',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get invalidMail {
    return Intl.message(
      'Invalid Email',
      name: 'invalidMail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone`
  String get invalidPhone {
    return Intl.message(
      'Invalid Phone',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `votremail@xyz.com`
  String get hintEmail {
    return Intl.message(
      'votremail@xyz.com',
      name: 'hintEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Password`
  String get invalidPass {
    return Intl.message(
      'Invalid Password',
      name: 'invalidPass',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotPass {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPass',
      desc: '',
      args: [],
    );
  }

  /// `Connection`
  String get connexion {
    return Intl.message(
      'Connection',
      name: 'connexion',
      desc: '',
      args: [],
    );
  }

  /// `No Account yet?  `
  String get noAccount {
    return Intl.message(
      'No Account yet?  ',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Account creation...`
  String get registering {
    return Intl.message(
      'Account creation...',
      name: 'registering',
      desc: '',
      args: [],
    );
  }

  /// `Successful account creation check your emails...`
  String get registerSuccess {
    return Intl.message(
      'Successful account creation check your emails...',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Account creation failed`
  String get registerFailed {
    return Intl.message(
      'Account creation failed',
      name: 'registerFailed',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccount {
    return Intl.message(
      'Create an account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get username {
    return Intl.message(
      'User name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Different passwords`
  String get passError {
    return Intl.message(
      'Different passwords',
      name: 'passError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get cpassword {
    return Intl.message(
      'Confirm Password',
      name: 'cpassword',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account`
  String get alreadyAccount {
    return Intl.message(
      'I already have an account',
      name: 'alreadyAccount',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the email address`
  String get addEmail {
    return Intl.message(
      'Fill in the email address',
      name: 'addEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get dashboard {
    return Intl.message(
      'Home',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Cannot get current location`
  String get noLocation {
    return Intl.message(
      'Cannot get current location',
      name: 'noLocation',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure you enable GPS and try again`
  String get enableGps {
    return Intl.message(
      'Please make sure you enable GPS and try again',
      name: 'enableGps',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
