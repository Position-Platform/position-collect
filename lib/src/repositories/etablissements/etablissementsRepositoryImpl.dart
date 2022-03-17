// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:18:03 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-17 01:26:32
 */

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:positioncollect/src/api/etablissements/etablissementsApiService.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/batiments_model/horaire.dart';
import 'package:positioncollect/src/models/batiments_model/image.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/etablissement_model/etablissement_model.dart';
import 'package:positioncollect/src/models/search_model/search_model.dart';
import 'package:positioncollect/src/repositories/etablissements/etablissementsRepository.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/utils/result.dart';
import 'package:positioncollect/src/utils/tools.dart';

class EtablissementsRepositoryImpl implements EtablissementsRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final EtablissementsApiService? etablissementsApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  EtablissementsRepositoryImpl(
      {this.networkInfoHelper,
      this.etablissementsApiService,
      this.sharedPreferencesHelper});

  @override
  Future<Result<SearchModel>> searchEtablissements(String query) async {
    bool isConnected = await networkInfoHelper!.isConnected();

    if (isConnected) {
      try {
        final Response response =
            await etablissementsApiService!.searchEtablissements(query);

        var model = SearchModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<EtablissementModel>> addEtablissement(Data etablissement,
      String coverPath, int idSousCategorie, String idCommodite) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        var etab = etablissement.toJson();
        etab.addAll({'idSousCategorie': idSousCategorie});
        etab.addAll({'idCommodite': idCommodite});
        final Response response =
            await etablissementsApiService!.addEtablissement(token!, etab);

        debugPrint(response.error.toString());

        var model = EtablissementModel.fromJson(response.body);

        int idEtablissement = model.data!.id!;

        int? statusCode = await uploadImage('cover', coverPath,
            apiUrl + "/api/etablissements/$idEtablissement", token);

        if (statusCode == 200 || statusCode == 201) {
          return Result(success: model);
        } else {
          return Result(error: UploadError());
        }
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<Horaire>> addHoraire(Horaire horaire) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        final Response response = await etablissementsApiService!
            .addHoraire(token!, horaire.toJson());

        var model = Horaire.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<Image>> addImage(Image image) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        final Response response =
            await etablissementsApiService!.addImage(token!, image.toJson());

        var model = Image.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
