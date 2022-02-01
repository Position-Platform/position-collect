/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-01 13:24:24 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-01 14:25:46
 */
// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/utils/config.dart';

part 'nominatimService.chopper.dart';

@ChopperApi(baseUrl: nominatimUrl)
abstract class NominatimService extends ChopperService {
  static NominatimService create([ChopperClient? client]) =>
      _$NominatimService(client);

  // Reverse Nominatim
  @Get(path: '/reverse', headers: {'Accept': 'application/json'})
  Future<Response> reverse(@Query("format") String format,
      @Query("lat") String lat, @Query("lon") String lon);
}
