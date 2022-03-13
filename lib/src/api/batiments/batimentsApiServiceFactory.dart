// ignore_for_file: file_names, avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:36:23 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-13 06:57:42
 */

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/batiments/batimentsApiService.dart';
import 'package:positioncollect/src/utils/config.dart';

class BatimentsApiServiceFactory implements BatimentsApiService {
  final ApiService? apiService;

  BatimentsApiServiceFactory({this.apiService});

  @override
  Future<Response> getBatiments(String token) async {
    Response response;
    try {
      response = await apiService!.getbatiments("Bearer " + token, apiKey);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> addBatiment(String token, Map<String, dynamic> body) async {
    Response response;
    try {
      response = await apiService!.addbatiment("Bearer " + token, apiKey, body);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
