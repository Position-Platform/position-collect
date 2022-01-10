/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:02:35 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:02:35 
 */
// ignore_for_file: file_names, avoid_print

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/auth/authApiService.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/response_model/response_model.dart';
import 'package:positioncollect/src/models/user_model/user_model.dart';

import 'package:positioncollect/src/repositories/auth/authRepositoryImpl.dart';
import 'package:positioncollect/src/utils/result.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final AuthApiService? authApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  AuthRepositoryImpl(
      {this.networkInfoHelper,
      this.authApiService,
      this.sharedPreferencesHelper});

  @override
  Future<bool> deleteToken() async {
    bool delete = await sharedPreferencesHelper!.deleteToken();
    return delete;
  }

  @override
  Future<Result<ResponseModel>> forgotpassword(String email) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await authApiService!.forgotPassword(email);

        var model = ResponseModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<UserModel>> getuser(String token) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await authApiService!.getUser(token);

        var model = UserModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<bool> hasToken() async {
    bool hasToken;
    String? token = await sharedPreferencesHelper!.getToken();
    if (token != null) {
      hasToken = true;
    } else {
      hasToken = false;
    }

    return hasToken;
  }

  @override
  Future<Result<UserModel>> login(String phone, String password) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await authApiService!.login(phone, password);

        var model = UserModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<ResponseModel>> logout(String token) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await authApiService!.logout(token);

        var model = ResponseModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<bool> saveToken(String token) async {
    bool saveT = await sharedPreferencesHelper!.setToken(token);
    return saveT;
  }
}
