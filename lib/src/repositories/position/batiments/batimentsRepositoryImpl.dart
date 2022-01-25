// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:41:32 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-21 14:44:11
 */

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/position/batiments/batimentsApiService.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/repositories/position/batiments/batimentsRepository.dart';
import 'package:positioncollect/src/utils/result.dart';

class BatimentsRepositoryImpl implements BatimentsRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final BatimentsApiService? batimentsApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  BatimentsRepositoryImpl(
      {this.networkInfoHelper,
      this.batimentsApiService,
      this.sharedPreferencesHelper});

  @override
  Future<Result<String>> getBatiments() async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await batimentsApiService!.getBatiments();

        return Result(success: response.bodyString);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
