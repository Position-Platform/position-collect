// ignore_for_file: file_names, avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:12:22 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-03 01:13:44
 */

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/etablissements/etablissementsApiService.dart';
import 'package:positioncollect/src/utils/config.dart';

class EtablissementsApiServiceFactory implements EtablissementsApiService {
  final ApiService? apiService;

  EtablissementsApiServiceFactory({this.apiService});

  @override
  Future<Response> searchEtablissements(String query) async {
    Response response;
    try {
      response = await apiService!.searchetablissement(apiKey, query);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> addEtablissement(
      String token, Map<String, dynamic> etablissement) async {
    Response response;
    try {
      response = await apiService!
          .addetablissement("Bearer " + token, apiKey, etablissement);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> addHoraire(
      String token, Map<String, dynamic> horaire) async {
    Response response;
    try {
      response =
          await apiService!.addhoraire("Bearer " + token, apiKey, horaire);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> deleteEtablissement(
      String token, int idEtablissement) async {
    Response response;
    try {
      response = await apiService!
          .deleteetablissement("Bearer " + token, apiKey, idEtablissement);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> deleteHoraire(String token, int idHoraire) async {
    Response response;
    try {
      response =
          await apiService!.deletehoraire("Bearer " + token, apiKey, idHoraire);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> deleteImage(String token, int idImage) async {
    Response response;
    try {
      response =
          await apiService!.deleteimage("Bearer " + token, apiKey, idImage);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> updateEtablissement(
      String token, Map<String, dynamic> body, int idEtablissement) async {
    Response response;
    try {
      response = await apiService!.updateetablissement(
          "Bearer " + token, apiKey, body, idEtablissement);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> updateHoraire(
      String token, Map<String, dynamic> body, int idHoraire) async {
    Response response;
    try {
      response = await apiService!
          .updatehoraire("Bearer " + token, apiKey, body, idHoraire);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
