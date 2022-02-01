// ignore_for_file: file_names, avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-01 13:36:14 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-01 14:22:02
 */

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/nominatim/nominatimApiService.dart';
import 'package:positioncollect/src/api/nominatimService.dart';

class NominatimApiServiceFactory implements NominatimApiService {
  final NominatimService? nominatimService;

  NominatimApiServiceFactory({this.nominatimService});

  @override
  Future<Response> reverseNominatim(String lat, String lon) async {
    Response response;
    try {
      response = await nominatimService!.reverse("json", lat, lon);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
