// ignore_for_file: file_names, avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 11:58:23 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-17 12:03:03
 */

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/position/tracking/trackingApiService.dart';
import 'package:positioncollect/src/utils/config.dart';

class TrackingApiServiceFactory implements TrackingApiService {
  final ApiService? apiService;

  TrackingApiServiceFactory({this.apiService});

  @override
  Future<Response> addtracking(
      String token, String longitude, String latitude) async {
    Response response;
    try {
      response = await apiService!.addtracking("Bearer " + token, apiKey,
          {"longitude": longitude, "latitude": latitude});
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
