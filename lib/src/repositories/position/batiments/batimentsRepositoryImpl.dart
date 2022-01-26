// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:41:32 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-27 00:02:41
 */

import 'package:chopper/chopper.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/src/api/position/batiments/batimentsApiService.dart';
import 'package:positioncollect/src/database/database.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/batiments_model/batiments_model.dart';
import 'package:positioncollect/src/models/batiments_model/datum.dart';
import 'package:positioncollect/src/repositories/position/batiments/batimentsRepository.dart';
import 'package:positioncollect/src/utils/result.dart';

class BatimentsRepositoryImpl implements BatimentsRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final BatimentsApiService? batimentsApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;
  final BatimentsDao? batimentsDao;

  BatimentsRepositoryImpl(
      {this.networkInfoHelper,
      this.batimentsApiService,
      this.sharedPreferencesHelper,
      this.batimentsDao});

  @override
  Future<Result<BatimentsModel>> getBatiments() async {
    bool isConnected = await networkInfoHelper!.isConnected();

    try {
      var batimentsBD = await batimentsDao!.getBatiments();

      if (batimentsBD.isNotEmpty) {
        List<Datum> batiments = [];
        for (var i = 0; i < batimentsBD.length; i++) {
          batiments.add(batimentsBD[i].batiment!);
        }
        BatimentsModel batimentsModel =
            BatimentsModel(success: true, message: "Success", data: batiments);

        return Result(success: batimentsModel);
      } else {
        if (isConnected) {
          try {
            final Response response = await batimentsApiService!.getBatiments();

            var model = BatimentsModel.fromJson(response.body);

            for (var i = 0; i < model.data!.length; i++) {
              BatimentsCompanion batimentsCompanion = BatimentsCompanion(
                  id: Value(model.data![i].id!),
                  batiment: Value(model.data![i]));

              await batimentsDao!.insertBatiment(batimentsCompanion);
            }

            return Result(success: model);
          } catch (e) {
            return Result(error: ServerError());
          }
        } else {
          return Result(error: NoInternetError());
        }
      }
    } catch (e) {
      return Result(error: DbDataError());
    }
  }
}
