// ignore_for_file: file_names, avoid_print

/*
 * Created on Thu Jan 06 2022 by Boris Gautier
 *
 * Copyright (c) 2022 
 */

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/auth/authApiService.dart';
import 'package:positioncollect/src/utils/config.dart';

class AuthApiServiceFactory implements AuthApiService {
  final ApiService? apiService;

  AuthApiServiceFactory({this.apiService});

  @override
  Future<Response> forgotPassword(String email) async {
    Response response;

    try {
      response = await apiService!.forgetPassword({"email": email});
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> getUser(String token) async {
    Response response;
    try {
      response = await apiService!.getuser(apiKey, 'Bearer ' + token);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> login(String phone, String password) async {
    Response response;

    try {
      response = await apiService!
          .login(apiKey, {"phone": phone, "password": password});
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> logout(String token) async {
    Response response;
    try {
      response = await apiService!.logout(apiKey, 'Bearer ' + token);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
