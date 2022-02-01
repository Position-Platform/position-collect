// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-01 14:28:37 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-01 14:37:42
 */

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/nominatim/nominatimApiService.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/nominatim_reverse_model/nominatim_reverse_model.dart';
import 'package:positioncollect/src/repositories/nominatim/nominatimRepository.dart';
import 'package:positioncollect/src/utils/result.dart';

class NominatimRepositoryImpl implements NominatimRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final NominatimApiService? nominatimApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  NominatimRepositoryImpl(
      {this.networkInfoHelper,
      this.nominatimApiService,
      this.sharedPreferencesHelper});

  @override
  Future<Result<NominatimReverseModel>> reverseNominatim(
      String lat, lon) async {
    bool isConnected = await networkInfoHelper!.isConnected();

    if (isConnected) {
      try {
        final Response response =
            await nominatimApiService!.reverseNominatim(lat, lon);

        var model = NominatimReverseModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
