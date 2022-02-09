// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:11:30 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 00:14:18
 */
import 'dart:io';

import 'package:chopper/chopper.dart';

abstract class EtablissementsApiService {
  Future<Response> searchEtablissements(String query);

  Future<Response> addEtablissement(String token, int idBatiment, String nom,
      int idSousCategorie, int idCommercial, int etage, File file,
      {String indicationAdresse,
      String codePostal,
      String description,
      String siteInternet,
      int idManager});

  Future<Response> addHoraire(String token, int idEtablissement, String jour,
      String ouvert, String heureOuverture, String heureFermeture);

  Future<Response> addTelephone(String token, int idEtablissement,
      String numero, String principal, String whatsapp);

  Future<Response> addImage(String token, int idEtablissement, File file);
}
