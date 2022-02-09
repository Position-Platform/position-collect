// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:16:52 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-09 13:57:30
 */

import 'dart:io';

import 'package:positioncollect/src/models/batiments_model/etablissements.dart';
import 'package:positioncollect/src/models/batiments_model/horaires.dart';
import 'package:positioncollect/src/models/batiments_model/images.dart';
import 'package:positioncollect/src/models/batiments_model/telephones.dart';
import 'package:positioncollect/src/models/search_model/search_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class EtablissementsRepository {
  Future<Result<SearchModel>> searchEtablissements(String query);

  Future<Result<Etablissements>> addEtablissement(int idBatiment, String nom,
      int idSousCategorie, int idCommercial, int etage, File file,
      {String indicationAdresse,
      String codePostal,
      String description,
      String siteInternet,
      int idManager});

  Future<Result<Horaires>> addHoraire(int idEtablissement, String jour,
      String ouvert, String heureOuverture, String heureFermeture);

  Future<Result<Images>> addImage(int idEtablissement, File file);

  Future<Result<Telephones>> addTelephone(
      int idEtablissement, String numero, String principal, String whatsapp);
}
