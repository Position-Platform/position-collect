// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:35:43 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-27 11:23:44
 */

import 'dart:io';

import 'package:chopper/chopper.dart';

abstract class BatimentsApiService {
  Future<Response> getBatiments();

  Future<Response> getBatimentsNumber();

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
      {String nom,
      String indication});
}
