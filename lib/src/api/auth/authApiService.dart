/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 08:59:51 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 08:59:51 
 */
// ignore_for_file: file_names

import 'package:chopper/chopper.dart';

abstract class AuthApiService {
  Future<Response> login(String phone, String password);

  Future<Response> getUser(String token);

  Future<Response> forgotPassword(String email);

  Future<Response> logout(String token);
}
