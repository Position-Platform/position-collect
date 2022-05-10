import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:positioncollect/src/models/batiment_model/data.dart';
import 'package:positioncollect/src/models/etablissement_model/data.dart'
    as etablissement;
import 'package:positioncollect/src/models/etablissement_update_model/data.dart'
    as etablissementupdate;
import 'package:positioncollect/src/repositories/batiments/batimentsRepository.dart';
import 'package:positioncollect/src/repositories/etablissements/etablissementsRepository.dart';

part 'edit_business_event.dart';
part 'edit_business_state.dart';

class EditBusinessBloc extends Bloc<EditBusinessEvent, EditBusinessState> {
  BatimentsRepository? batimentsRepository;
  EtablissementsRepository? etablissementsRepository;

  EditBusinessBloc({this.batimentsRepository, this.etablissementsRepository})
      : super(EditBusinessInitial()) {
    on<UpdateBatiment>(_updateBatiment);
    on<UpdateEtablissement>(_updateEtablissement);
  }

  void _updateBatiment(
    UpdateBatiment event,
    Emitter<EditBusinessState> emit,
  ) async {
    emit(EditBusinessLoading());
    try {
      final batimentResult = await batimentsRepository!.updateBatiment(
        event.batiment,
        event.batiment.id!,
        imagePath: event.imagePath,
      );
      emit(BatimentUpdated(batimentResult.success!.data!));
    } catch (e) {
      emit(EditBusinessError());
    }
  }

  void _updateEtablissement(
    UpdateEtablissement event,
    Emitter<EditBusinessState> emit,
  ) async {
    emit(EditBusinessLoading());
    try {
      final etabResult = await etablissementsRepository!.updateEtablissement(
        event.etab,
        event.etab.id!,
        coverPath: event.coverPath,
      );
      emit(EtablissementUpdated(etabResult.success!.data!));
    } catch (e) {
      emit(EditBusinessError());
    }
  }
}
