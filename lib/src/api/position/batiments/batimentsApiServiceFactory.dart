// ignore_for_file: file_names, avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:36:23 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-21 14:38:31
 */

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/position/batiments/batimentsApiService.dart';
import 'package:positioncollect/src/utils/config.dart';

class BatimentsApiServiceFactory implements BatimentsApiService {
  final ApiService? apiService;

  BatimentsApiServiceFactory({this.apiService});

  @override
  Future<Response> getBatiments() async {
    Response response;
    try {
      response = await apiService!.getbatiments(apiKey);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
