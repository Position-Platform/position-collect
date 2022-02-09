// ignore_for_file: file_names, avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:36:23 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-27 11:24:24
 */

import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/batiments/batimentsApiService.dart';
import 'package:positioncollect/src/utils/config.dart';

class BatimentsApiServiceFactory implements BatimentsApiService {
  final ApiService? apiService;

  BatimentsApiServiceFactory({this.apiService});

  @override
  Future<Response> getBatiments() async {
    Response response;
    try {
      response = await apiService!.getbatiments(apiKey);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> getBatimentsNumber() async {
    Response response;
    try {
      response = await apiService!.getbatimentsnumber(apiKey);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> addBatiment(
      String token,
      String codeBatiment,
      int nombreNiveau,
      String longitude,
      String latitude,
      String rue,
      String ville,
      String commune,
      String quartier,
      File file,
      {String? nom,
      String? indication}) async {
    Response response;
    try {
      response = await apiService!.addbatiment(token, apiKey, {
        "nom": nom,
        "nombreNiveaux": nombreNiveau,
        "codeBatiment": codeBatiment,
        "longitude": longitude,
        "latitude": latitude,
        "indication": indication,
        "rue": rue,
        "ville": ville,
        "commune": commune,
        "quartier": quartier,
        "file": file
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
