/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:00:29 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-19 14:24:13
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

  @Post(
      path: '/api/auth/password/reset', headers: {'Accept': 'application/json'})
  Future<Response> resetPassword(@Body() Map<String, dynamic> body);

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
  @Get(path: '/api/batiments', headers: {'Accept': 'application/json'})
  Future<Response> getbatiments(
    @Header('Authorization') String token,
    @Header('X-Authorization') String apiKey,
  );

  @Get(path: '/api/batiments/{id}', headers: {'Accept': 'application/json'})
  Future<Response> getbatimentsbyId(@Header('Authorization') String token,
      @Header('X-Authorization') String apiKey, @Path('id') int idBatiment);

  @Delete(path: '/api/batiments/{id}', headers: {'Accept': 'application/json'})
  Future<Response> deletebatiment(@Header('Authorization') String token,
      @Header('X-Authorization') String apiKey, @Path('id') int idBatiment);

  @Post(path: '/api/batiments', headers: {'Accept': 'application/json'})
  Future<Response> addbatiment(
      @Header('Authorization') String token,
      @Header('X-Authorization') String apiKey,
      @Body() Map<String, dynamic> body);

  @Put(path: '/api/batiments/{id}', headers: {'Accept': 'application/json'})
  Future<Response> updatebatiment(
      @Header('Authorization') String token,
      @Header('X-Authorization') String apiKey,
      @Body() Map<String, dynamic> body,
      @Path('id') int idBatiment);

//Etablissements
  @Get(
      path: '/api/search/etablissements',
      headers: {'Accept': 'application/json'})
  Future<Response> searchetablissement(
      @Header('X-Authorization') String apiKey, @Query('q') String query);

  @Post(path: '/api/etablissements', headers: {'Accept': 'application/json'})
  Future<Response> addetablissement(
      @Header('Authorization') String token,
      @Header('X-Authorization') String apiKey,
      @Body() Map<String, dynamic> body);

  @Put(
      path: '/api/etablissements/{id}', headers: {'Accept': 'application/json'})
  Future<Response> updateetablissement(
      @Header('Authorization') String token,
      @Header('X-Authorization') String apiKey,
      @Body() Map<String, dynamic> body,
      @Path('id') int idEtablissement);

  @Delete(
      path: '/api/etablissements/{id}', headers: {'Accept': 'application/json'})
  Future<Response> deleteetablissement(
      @Header('Authorization') String token,
      @Header('X-Authorization') String apiKey,
      @Path('id') int idEtablissement);
//Horaires
  @Post(path: '/api/horaires', headers: {'Accept': 'application/json'})
  Future<Response> addhoraire(
      @Header('Authorization') String token,
      @Header('X-Authorization') String apiKey,
      @Body() Map<String, dynamic> body);

  @Put(path: '/api/horaires/{id}', headers: {'Accept': 'application/json'})
  Future<Response> updatehoraire(
      @Header('Authorization') String token,
      @Header('X-Authorization') String apiKey,
      @Body() Map<String, dynamic> body,
      @Path('id') int idHoraire);

  @Delete(path: '/api/horaires/{id}', headers: {'Accept': 'application/json'})
  Future<Response> deletehoraire(@Header('Authorization') String token,
      @Header('X-Authorization') String apiKey, @Path('id') int idHoraire);

//Images

  @Delete(path: '/api/images/{id}', headers: {'Accept': 'application/json'})
  Future<Response> deleteimage(@Header('Authorization') String token,
      @Header('X-Authorization') String apiKey, @Path('id') int idImage);

// SousCategories
  @Get(path: '/api/souscategories', headers: {'Accept': 'application/json'})
  Future<Response> getsouscategories(
    @Header('X-Authorization') String apiKey,
  );
}
