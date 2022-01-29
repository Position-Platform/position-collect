// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 11:56:48 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-17 12:00:44
 */

import 'package:chopper/chopper.dart';

abstract class TrackingApiService {
  Future<Response> addtracking(String token, String longitude, String latitude);
}
