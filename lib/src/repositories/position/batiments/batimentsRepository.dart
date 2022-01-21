// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:40:24 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-21 14:41:07
 */

import 'package:positioncollect/src/models/batiments_model/batiments_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class BatimentsRepository {
  Future<Result<BatimentsModel>> getBatiments();
}
