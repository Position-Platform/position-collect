// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:16:52 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-19 14:48:49
 */

import 'package:positioncollect/src/models/batiment_model/horaire.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/etablissement_model/etablissement_model.dart';
import 'package:positioncollect/src/models/etablissement_update_model/etablissement_update_model.dart';
import 'package:positioncollect/src/models/etablissements_model/etablissements_model.dart';
import 'package:positioncollect/src/models/horaire_model/horaire_model.dart';
import 'package:positioncollect/src/models/response_model/response_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class EtablissementsRepository {
  Future<Result<EtablissementsModel>> searchEtablissements(String query);

  Future<Result<EtablissementModel>> addEtablissement(Data etablissement,
      String coverPath, int idSousCategorie, String idCommodite);

  Future<Result<EtablissementUpdateModel>> updateEtablissement(
      Data batiment, int idEtablissement,
      {String? coverPath});

  Future<Result<ResponseModel>> deleteEtablissement(int idEtablissement);

  Future<Result<Horaire>> addHoraire(Horaire horaire);

  Future<Result<HoraireModel>> updateHoraire(Horaire horaire, int idHoraire);

  Future<Result<ResponseModel>> deleteHoraire(int idHoraire);

  Future<Result<int>> addImage(String imagePath, int idEtablissement);

  Future<Result<int>> updateImage(String imagePath, int idEtablissement);

  Future<Result<ResponseModel>> deleteImage(int idImage);
}
