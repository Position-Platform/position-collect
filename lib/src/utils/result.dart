// ignore_for_file: file_names, avoid_print

/*
 * Created on Fri Jan 07 2022 by Boris Gautier
 *
 * Copyright (c) 2022 
 */

class Result<T> {
  final T? success;

  final Error? error;

  Result({this.success, this.error});
}

class Success<T> extends Result {
  final T? data = null;

  Success(data);
}

class Error extends Result {}

class NoInternetError extends Error {}

class ServerError extends Error {}

class DbInsertError extends Error {}

class DbDataError extends Error {}

class DbDeleteError extends Error {}
