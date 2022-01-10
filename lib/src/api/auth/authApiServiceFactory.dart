/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:00:00 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-10 06:03:17
 */
// ignore_for_file: file_names, avoid_print

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
      response = await apiService!.getuser('Bearer ' + token, apiKey);
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
      response = await apiService!.logout('Bearer ' + token, apiKey);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
