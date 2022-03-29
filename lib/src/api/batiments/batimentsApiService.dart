// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:35:43 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-28 21:33:30
 */

import 'package:chopper/chopper.dart';

abstract class BatimentsApiService {
  Future<Response> getBatiments(String token);

  Future<Response> getBatimentsById(String token, int idBatiment);

  Future<Response> addBatiment(String token, Map<String, dynamic> body);

  Future<Response> getSousCategories();
}
