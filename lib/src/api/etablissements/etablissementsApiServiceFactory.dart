// ignore_for_file: file_names, avoid_print

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:12:22 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 00:14:41
 */
import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/apiService.dart';
import 'package:positioncollect/src/api/etablissements/etablissementsApiService.dart';
import 'package:positioncollect/src/utils/config.dart';

class EtablissementsApiServiceFactory implements EtablissementsApiService {
  final ApiService? apiService;

  EtablissementsApiServiceFactory({this.apiService});

  @override
  Future<Response> searchEtablissements(String query) async {
    Response response;
    try {
      response = await apiService!.searchetablissement(apiKey, query);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
