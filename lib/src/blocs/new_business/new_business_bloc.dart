/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 22:18:25 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-16 22:39:27
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:positioncollect/src/helpers/sharedPreferences.dart';
import 'package:positioncollect/src/models/sous_categories_model/datum.dart';
import 'package:positioncollect/src/models/batiment_model/data.dart'
    as batiment;
import 'package:positioncollect/src/models/etablissement_model/data.dart'
    as etablissement;
import 'package:positioncollect/src/repositories/batiments/batimentsRepository.dart';
import 'package:positioncollect/src/repositories/etablissements/etablissementsRepository.dart';
import 'package:positioncollect/src/utils/result.dart';

part 'new_business_event.dart';
part 'new_business_state.dart';

class NewBusinessBloc extends Bloc<NewBusinessEvent, NewBusinessState> {
  BatimentsRepository? batimentsRepository;
  EtablissementsRepository? etablissementsRepository;
  SharedPreferencesHelper? sharedPreferencesHelper;
  NewBusinessBloc(
      {this.batimentsRepository,
      this.sharedPreferencesHelper,
      this.etablissementsRepository})
      : super(NewBusinessInitial()) {
    on<GetSousCategories>(_getSousCategories);
    on<FormPage1>(_goToPage2);
    on<AddBatiment>(_addBatiment);
    on<AddEtablissement>(_addEtablissement);
    on<FormPage3>(_goToPage4);
    on<FormPage4>(_goToPage5);
  }

  void _getSousCategories(
    GetSousCategories event,
    Emitter<NewBusinessState> emit,
  ) async {
    emit(SousCategoriesLoading());
    try {
      var sousCategoriesResult = await batimentsRepository!.getSousCategories();
      emit(SousCategoriesLoaded(sousCategoriesResult.success!.data!));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void _goToPage2(
    FormPage1 event,
    Emitter<NewBusinessState> emit,
  ) async {
    if (event.batiments.codeBatiment!.isEmpty ||
        event.batiments.commune!.isEmpty ||
        event.batiments.latitude!.isEmpty ||
        event.batiments.longitude!.isEmpty ||
        event.batiments.nombreNiveau!.isEmpty ||
        event.batiments.quartier!.isEmpty ||
        event.batiments.rue!.isEmpty) {
      emit(FormError());
    } else {
      final idCommercial = await sharedPreferencesHelper!.getIdCommercial();
      event.batiments.idCommercial = idCommercial;
      emit(GoToPage2(event.batiments));
    }
  }

  void _addBatiment(
    AddBatiment event,
    Emitter<NewBusinessState> emit,
  ) async {
    emit(PageLoading());
    try {
      var batimentResult = await batimentsRepository!
          .addBatiment(event.batiments, event.imagePath);

      if (batimentResult.success!.success!) {
        emit(BatimentAdded(batimentResult.success!.data!));
      } else if (batimentResult.error! is UploadError) {
        emit(const Error("Upload Error"));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void _goToPage4(
    FormPage3 event,
    Emitter<NewBusinessState> emit,
  ) async {
    if (event.etablissements.nom!.isEmpty ||
        event.etablissements.etage!.isEmpty) {
      emit(FormError());
    } else {
      final idCommercial = await sharedPreferencesHelper!.getIdCommercial();
      event.etablissements.idCommercial = idCommercial;
      emit(GoToPage4(
          event.etablissements, event.coverPath, event.idSousCategorie));
    }
  }

  void _goToPage5(
    FormPage4 event,
    Emitter<NewBusinessState> emit,
  ) async {
    emit(GoToPage5(event.etablissements, event.coverPath, event.idSousCategorie,
        event.idCommodite));
  }

  void _addEtablissement(
    AddEtablissement event,
    Emitter<NewBusinessState> emit,
  ) async {
    emit(PageLoading());
    try {
      var etablissementResult = await etablissementsRepository!
          .addEtablissement(event.etablissements, event.coverPath,
              event.idSousCategorie, event.idCommodite);

      if (etablissementResult.success!.success!) {
        emit(EtablissementAdded(etablissementResult.success!.data!));
      } else if (etablissementResult.error! is UploadError) {
        emit(const Error("Upload Error"));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
