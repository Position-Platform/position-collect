// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:16:52 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 00:17:50
 */

import 'package:positioncollect/src/models/search_model/search_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class EtablissementsRepository {
  Future<Result<SearchModel>> searchEtablissements(String query);
}
