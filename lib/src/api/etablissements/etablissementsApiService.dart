// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:11:30 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-03 01:13:28
 */

import 'package:chopper/chopper.dart';

abstract class EtablissementsApiService {
  Future<Response> searchEtablissements(String query);

  Future<Response> addEtablissement(String token, Map<String, dynamic> body);

  Future<Response> updateEtablissement(
      String token, Map<String, dynamic> body, int idEtablissement);

  Future<Response> deleteEtablissement(String token, int idEtablissement);

  Future<Response> addHoraire(String token, Map<String, dynamic> body);

  Future<Response> updateHoraire(
      String token, Map<String, dynamic> body, int idHoraire);

  Future<Response> deleteHoraire(String token, int idHoraire);

  Future<Response> deleteImage(String token, int idImage);
}
