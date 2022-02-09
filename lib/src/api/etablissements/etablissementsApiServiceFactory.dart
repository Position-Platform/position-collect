// ignore_for_file: file_names, avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:12:22 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 00:14:41
 */
import 'dart:io';

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
  Future<Response> addEtablissement(String token, int idBatiment, String nom,
      int idSousCategorie, int idCommercial, int etage, File file,
      {String? indicationAdresse,
      String? codePostal,
      String? description,
      String? siteInternet,
      int? idManager}) async {
    Response response;
    try {
      response = await apiService!.addetablissement(token, apiKey, {
        "idBatiment": idBatiment,
        "nom": nom,
        "indicationAdresse": indicationAdresse,
        "codePostal": codePostal,
        "siteInternet": siteInternet,
        "description": description,
        "idSousCategorie": idSousCategorie,
        "idCommercial": idCommercial,
        "idManager": idManager,
        "etage": etage,
        "file": file,
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> addHoraire(String token, int idEtablissement, String jour,
      String ouvert, String heureOuverture, String heureFermeture) async {
    Response response;
    try {
      response = await apiService!.addhoraire(token, apiKey, {
        "idEtablissement": idEtablissement,
        "jour": jour,
        "ouvert": ouvert,
        "heureOuverture": heureOuverture,
        "heureFermeture": heureFermeture
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> addImage(
      String token, int idEtablissement, File file) async {
    Response response;
    try {
      response = await apiService!.addimage(token, apiKey, {
        "idEtablissement": idEtablissement,
        "file": file,
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> addTelephone(String token, int idEtablissement,
      String numero, String principal, String whatsapp) async {
    Response response;
    try {
      response = await apiService!.addtelephone(token, apiKey, {
        "idEtablissement": idEtablissement,
        "numero": numero,
        "principal": principal,
        "whatsapp": whatsapp
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
