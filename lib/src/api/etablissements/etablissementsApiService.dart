// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:11:30 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 00:14:18
 */
import 'package:chopper/chopper.dart';

abstract class EtablissementsApiService {
  Future<Response> searchEtablissements(String query);
}
