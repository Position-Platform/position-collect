// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:40:24 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-27 11:25:06
 */

import 'package:positioncollect/src/models/batiments_model/batiments_model.dart';
import 'package:positioncollect/src/models/response_model/response_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class BatimentsRepository {
  Future<Result<BatimentsModel>> getBatiments();

  Future<Result<ResponseModel>> getBatimentsNumber();
}
