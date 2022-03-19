// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:16:52 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-12 22:06:47
 */

import 'package:positioncollect/src/models/batiment_model/horaire.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/etablissement_model/etablissement_model.dart';
import 'package:positioncollect/src/models/search_model/search_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class EtablissementsRepository {
  Future<Result<SearchModel>> searchEtablissements(String query);

  Future<Result<EtablissementModel>> addEtablissement(Data etablissement,
      String coverPath, int idSousCategorie, String idCommodite);

  Future<Result<Horaire>> addHoraire(Horaire horaire);

  Future<Result<int>> addImage(String imagePath, int idEtablissement);
}
