// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:41:32 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-27 11:26:25
 */

import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/src/api/batiments/batimentsApiService.dart';
import 'package:positioncollect/src/database/batiments/batimentDao.dart';
import 'package:positioncollect/src/database/database.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/batiments_model/batiments.dart';
import 'package:positioncollect/src/models/batiments_model/batiments_model.dart';
import 'package:positioncollect/src/models/batiments_model/datum.dart';
import 'package:positioncollect/src/models/response_model/response_model.dart';
import 'package:positioncollect/src/repositories/batiments/batimentsRepository.dart';
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
                  batiment: Value(model.data![i]),
                  online: const Value(true));

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

  @override
  Future<Result<ResponseModel>> getBatimentsNumber() async {
    bool isConnected = await networkInfoHelper!.isConnected();

    if (isConnected) {
      try {
        final Response response =
            await batimentsApiService!.getBatimentsNumber();

        var model = ResponseModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<Batiments>> addBatiment(
      String codeBatiment,
      int nombreNiveau,
      String longitude,
      String latitude,
      String rue,
      String ville,
      String commune,
      String quartier,
      File file,
      {String? nom,
      String? indication}) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        final Response response = await batimentsApiService!.addBatiment(
            token!,
            codeBatiment,
            nombreNiveau,
            longitude,
            latitude,
            rue,
            ville,
            commune,
            quartier,
            file,
            nom: nom!,
            indication: indication!);

        var model = Batiments.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
