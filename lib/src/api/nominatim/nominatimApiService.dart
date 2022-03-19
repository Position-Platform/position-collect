// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-01 13:35:55 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-01 14:23:28
 */

import 'package:chopper/chopper.dart';

abstract class NominatimApiService {
  Future<Response> reverseNominatim(String lat, String lon);
}
