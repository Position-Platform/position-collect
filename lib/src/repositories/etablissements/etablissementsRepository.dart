// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:16:52 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-12 22:06:47
 */

import 'package:positioncollect/src/models/batiments_model/etablissement.dart';
import 'package:positioncollect/src/models/batiments_model/horaire.dart';
import 'package:positioncollect/src/models/batiments_model/image.dart';
import 'package:positioncollect/src/models/search_model/search_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class EtablissementsRepository {
  Future<Result<SearchModel>> searchEtablissements(String query);

  Future<Result<Etablissement>> addEtablissement(Etablissement etablissement);

  Future<Result<Horaire>> addHoraire(Horaire horaire);

  Future<Result<Image>> addImage(Image image);
}
