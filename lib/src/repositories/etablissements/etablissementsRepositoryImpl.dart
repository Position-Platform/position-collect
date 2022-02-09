// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:18:03 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-09 14:01:50
 */
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/etablissements/etablissementsApiService.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/batiments_model/etablissements.dart';
import 'package:positioncollect/src/models/batiments_model/telephones.dart';
import 'package:positioncollect/src/models/batiments_model/images.dart';
import 'package:positioncollect/src/models/batiments_model/horaires.dart';
import 'package:positioncollect/src/models/search_model/search_model.dart';
import 'package:positioncollect/src/repositories/etablissements/etablissementsRepository.dart';
import 'package:positioncollect/src/utils/result.dart';

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
  Future<Result<Etablissements>> addEtablissement(int idBatiment, String nom,
      int idSousCategorie, int idCommercial, int etage, File file,
      {String? indicationAdresse,
      String? codePostal,
      String? description,
      String? siteInternet,
      int? idManager}) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        final Response response = await etablissementsApiService!
            .addEtablissement(token!, idBatiment, nom, idSousCategorie,
                idCommercial, etage, file,
                indicationAdresse: indicationAdresse!,
                codePostal: codePostal!,
                description: description!,
                idManager: idManager!,
                siteInternet: siteInternet!);

        var model = Etablissements.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<Horaires>> addHoraire(int idEtablissement, String jour,
      String ouvert, String heureOuverture, String heureFermeture) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        final Response response = await etablissementsApiService!.addHoraire(
            token!,
            idEtablissement,
            jour,
            ouvert,
            heureOuverture,
            heureFermeture);

        var model = Horaires.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<Images>> addImage(int idEtablissement, File file) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        final Response response = await etablissementsApiService!
            .addImage(token!, idEtablissement, file);

        var model = Images.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<Telephones>> addTelephone(int idEtablissement, String numero,
      String principal, String whatsapp) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        final Response response = await etablissementsApiService!
            .addTelephone(token!, idEtablissement, numero, principal, whatsapp);

        var model = Telephones.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
