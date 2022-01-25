/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:00:29 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-17 11:48:01
 */
// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/utils/config.dart';

part 'apiService.chopper.dart';

@ChopperApi(baseUrl: apiUrl)
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient? client]) => _$ApiService(client);

// User Api
  @Post(path: '/api/auth/login', headers: {'Accept': 'application/json'})
  Future<Response> login(@Header('X-Authorization') String apiKey,
      @Body() Map<String, dynamic> body);

  @Get(path: '/api/user/me', headers: {'Accept': 'application/json'})
  Future<Response> getuser(
    @Header('Authorization') String token,
    @Header('X-Authorization') String apiKey,
  );

  @Post(
      path: '/api/auth/password/forgot',
      headers: {'Accept': 'application/json'})
  Future<Response> forgetPassword(@Body() Map<String, dynamic> body);

  @Get(path: '/api/auth/logout', headers: {'Accept': 'application/json'})
  Future<Response> logout(
    @Header('Authorization') String token,
    @Header('X-Authorization') String apiKey,
  );

//Tracking Api
  @Post(path: '/api/tracking', headers: {'Accept': 'application/json'})
  Future<Response> addtracking(
      @Header('Authorization') String token,
      @Header('X-Authorization') String apiKey,
      @Body() Map<String, dynamic> body);

//Batiment Api
  @Get(path: '/api/batimentsgeojson', headers: {'Accept': 'application/json'})
  Future<Response> getbatiments(
    @Header('X-Authorization') String apiKey,
  );
}
