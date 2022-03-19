/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:03:01 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-16 06:34:17
 */
// ignore_for_file: file_names, avoid_print

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

class UploadError extends Error {}

class DbInsertError extends Error {}

class DbDataError extends Error {}

class DbDeleteError extends Error {}
