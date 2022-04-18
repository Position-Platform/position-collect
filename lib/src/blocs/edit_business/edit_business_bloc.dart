import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:positioncollect/src/models/batiment_model/data.dart';
import 'package:positioncollect/src/repositories/batiments/batimentsRepository.dart';

part 'edit_business_event.dart';
part 'edit_business_state.dart';

class EditBusinessBloc extends Bloc<EditBusinessEvent, EditBusinessState> {
  BatimentsRepository? batimentsRepository;
  EditBusinessBloc({this.batimentsRepository}) : super(EditBusinessInitial()) {
    on<UpdateBatiment>(_updateBatiment);
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
}
