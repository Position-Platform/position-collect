// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 12:25:31 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-17 12:26:51
 */

import 'package:positioncollect/src/models/tracking_model/tracking_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class TrackingRepository {
  Future<Result<TrackingModel>> addtracking(String longitude, String latitude);
}
