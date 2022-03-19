// ignore_for_file: file_names, avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:12:22 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-17 01:30:40
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
  Future<Response> addImage(String token, Map<String, dynamic> image) async {
    Response response;
    try {
      response = await apiService!.addimage("Bearer " + token, apiKey, image);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
