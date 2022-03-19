// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:11:30 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-12 21:58:24
 */

import 'package:chopper/chopper.dart';

abstract class EtablissementsApiService {
  Future<Response> searchEtablissements(String query);

  Future<Response> addEtablissement(String token, Map<String, dynamic> body);

  Future<Response> addHoraire(String token, Map<String, dynamic> body);

  Future<Response> addImage(String token, Map<String, dynamic> body);
}
