// ignore_for_file: file_names, avoid_print

/*
 * Created on Fri Jan 07 2022 by Boris Gautier
 *
 * Copyright (c) 2022 
 */

import 'package:positioncollect/src/models/response_model/response_model.dart';
import 'package:positioncollect/src/models/user_model/user_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class AuthRepository {
  Future<Result<UserModel>> login(String phone, String password);

  Future<Result<UserModel>> getuser(String token);

  Future<Result<ResponseModel>> forgotpassword(String email);

  Future<bool> deleteToken();

  Future<bool> saveToken(String token);

  Future<bool> hasToken();

  Future<Result<ResponseModel>> logout(String token);
}
