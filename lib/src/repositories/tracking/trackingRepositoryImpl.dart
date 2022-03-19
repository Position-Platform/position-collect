// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 12:27:29 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-13 08:25:14
 */

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/tracking/trackingApiService.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/tracking_model/data.dart';
import 'package:positioncollect/src/models/tracking_model/tracking_model.dart';
import 'package:positioncollect/src/repositories/tracking/trackingRepository.dart';
import 'package:positioncollect/src/utils/result.dart';

class TrackingRepositoryImpl implements TrackingRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final TrackingApiService? trackingApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  TrackingRepositoryImpl(
      {this.networkInfoHelper,
      this.trackingApiService,
      this.sharedPreferencesHelper});

  @override
  Future<Result<TrackingModel>> addtracking(Data tracking) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();
    if (isConnected) {
      try {
        final Response response =
            await trackingApiService!.addtracking(token!, tracking.toJson());

        var model = TrackingModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
