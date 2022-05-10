// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:18:03 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-19 17:49:27
 */

import 'package:chopper/chopper.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:positioncollect/src/api/batiments/batimentsApiService.dart';
import 'package:positioncollect/src/api/etablissements/etablissementsApiService.dart';
import 'package:positioncollect/src/database/batiments/batimentDao.dart';
import 'package:positioncollect/src/database/database.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/batiment_model/horaire.dart';
import 'package:positioncollect/src/models/batiments_model/batiments_model.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart';
import 'package:positioncollect/src/models/etablissement_model/etablissement_model.dart';
import 'package:positioncollect/src/models/etablissement_update_model/etablissement_update_model.dart';
import 'package:positioncollect/src/models/etablissements_model/etablissements_model.dart';
import 'package:positioncollect/src/models/horaire_model/horaire_model.dart';
import 'package:positioncollect/src/models/response_model/response_model.dart';
import 'package:positioncollect/src/repositories/etablissements/etablissementsRepository.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/utils/result.dart';
import 'package:positioncollect/src/utils/tools.dart';

class EtablissementsRepositoryImpl implements EtablissementsRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final EtablissementsApiService? etablissementsApiService;
  final BatimentsApiService? batimentsApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;
  final BatimentsDao? batimentsDao;

  EtablissementsRepositoryImpl(
      {this.networkInfoHelper,
      this.etablissementsApiService,
      this.sharedPreferencesHelper,
      this.batimentsApiService,
      this.batimentsDao});

  @override
  Future<Result<EtablissementsModel>> searchEtablissements(String query) async {
    bool isConnected = await networkInfoHelper!.isConnected();

    if (isConnected) {
      try {
        final Response response =
            await etablissementsApiService!.searchEtablissements(query);

        var model = EtablissementsModel.fromJson(response.body);

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

        var model = EtablissementModel.fromJson(response.body);

        int idEtablissement = model.data!.id!;

        int? statusCode = await uploadImage('cover', coverPath,
            Configs.apiUrl + "/api/etablissements/$idEtablissement", token);

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
  Future<Result<int>> addImage(String imagePath, int idEtablissement) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        int? statusCode = await postImage('imageUrl', imagePath,
            Configs.apiUrl + "/api/images", token, idEtablissement.toString());

        var response = await batimentsApiService!.getBatiments(token!);

        var model = BatimentsModel.fromJson(response.body);

        for (var i = 0; i < model.data!.length; i++) {
          BatimentsCompanion batimentsCompanion = BatimentsCompanion(
              id: Value(model.data![i].id!),
              batiment: Value(model.data![i]),
              online: const Value(true));

          await batimentsDao!.insertBatiment(batimentsCompanion);
        }

        if (statusCode == 200 || statusCode == 201) {
          return Result(success: statusCode);
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
  Future<Result<ResponseModel>> deleteEtablissement(int idEtablissement) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        final Response response = await etablissementsApiService!
            .deleteEtablissement(token!, idEtablissement);

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
  Future<Result<ResponseModel>> deleteHoraire(int idHoraire) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        final Response response =
            await etablissementsApiService!.deleteHoraire(token!, idHoraire);

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
  Future<Result<ResponseModel>> deleteImage(int idImage) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();

    if (isConnected) {
      try {
        final Response response =
            await etablissementsApiService!.deleteImage(token!, idImage);

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
  Future<Result<EtablissementUpdateModel>> updateEtablissement(
      Data etablissement, int idEtablissement,
      {String? coverPath}) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();

    if (isConnected) {
      try {
        final Response response = await etablissementsApiService!
            .updateEtablissement(
                token!, etablissement.toJson(), idEtablissement);

        var model = EtablissementUpdateModel.fromJson(response.body);

        if (coverPath != null) {
          int? statusCode = await uploadImage('cover', coverPath,
              Configs.apiUrl + "/api/etablissements/$idEtablissement", token);

          if (statusCode == 200 || statusCode == 201) {
            final Response responseB =
                await batimentsApiService!.getBatiments(token);

            var modelBatiment = BatimentsModel.fromJson(responseB.body);

            for (var i = 0; i < modelBatiment.data!.length; i++) {
              BatimentsCompanion batimentsCompanion = BatimentsCompanion(
                  id: Value(modelBatiment.data![i].id!),
                  batiment: Value(modelBatiment.data![i]),
                  online: const Value(true));

              await batimentsDao!.insertBatiment(batimentsCompanion);
            }
            return Result(success: model);
          } else {
            return Result(error: UploadError());
          }
        } else {
          final Response responseB =
              await batimentsApiService!.getBatiments(token);

          var modelBatiment = BatimentsModel.fromJson(responseB.body);

          for (var i = 0; i < modelBatiment.data!.length; i++) {
            BatimentsCompanion batimentsCompanion = BatimentsCompanion(
                id: Value(modelBatiment.data![i].id!),
                batiment: Value(modelBatiment.data![i]),
                online: const Value(true));

            await batimentsDao!.insertBatiment(batimentsCompanion);
          }
          return Result(success: model);
        }
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<HoraireModel>> updateHoraire(
      Horaire horaire, int idHoraire) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();

    if (isConnected) {
      try {
        final Response response = await etablissementsApiService!
            .updateHoraire(token!, horaire.toJson(), idHoraire);

        var model = HoraireModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<int>> updateImage(String imagePath, int idEtablissement) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper?.getToken();

    if (isConnected) {
      try {
        int? statusCode = await postImage('imageUrl', imagePath,
            Configs.apiUrl + "/api/images", token, idEtablissement.toString());

        if (statusCode == 200 || statusCode == 201) {
          return Result(success: statusCode);
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
}
