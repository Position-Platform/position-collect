// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-01 14:28:46 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-01 14:34:07
 */

import 'package:positioncollect/src/models/nominatim_reverse_model/nominatim_reverse_model.dart';
import 'package:positioncollect/src/utils/result.dart';

abstract class NominatimRepository {
  Future<Result<NominatimReverseModel>> reverseNominatim(String lat, lon);
}
