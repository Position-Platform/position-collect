// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:35:43 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-21 14:36:17
 */

import 'package:chopper/chopper.dart';

abstract class BatimentsApiService {
  Future<Response> getBatiments();
}
