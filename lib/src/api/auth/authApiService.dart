// ignore_for_file: file_names

/*
 * Created on Thu Jan 06 2022 by Boris Gautier
 *
 * Copyright (c) 2022 
 */

import 'package:chopper/chopper.dart';

abstract class AuthApiService {
  Future<Response> login(String phone, String password);

  Future<Response> getUser(String token);

  Future<Response> forgotPassword(String email);

  Future<Response> logout(String token);
}
