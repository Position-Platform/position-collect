// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:40:24 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-27 11:25:06
 */

import 'dart:io';

import 'package:positioncollect/src/models/batiments_model/batiments.dart';
import 'package:positioncollect/src/models/batiments_model/batiments_model.dart';
import 'package:positioncollect/src/models/response_model/response_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class BatimentsRepository {
  Future<Result<BatimentsModel>> getBatiments();

  Future<Result<ResponseModel>> getBatimentsNumber();

  Future<Result<Batiments>> addBatiment(
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
      String? indication});
}
