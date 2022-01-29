// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-28 00:18:03 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 00:20:59
 */
import 'package:chopper/chopper.dart';
import 'package:positioncollect/src/api/etablissements/etablissementsApiService.dart';
import 'package:positioncollect/src/helpers/network.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
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
}
