/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 22:18:25 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-14 13:27:57
 */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:positioncollect/src/models/sous_categories_model/datum.dart';
import 'package:positioncollect/src/repositories/batiments/batimentsRepository.dart';

part 'new_business_event.dart';
part 'new_business_state.dart';

class NewBusinessBloc extends Bloc<NewBusinessEvent, NewBusinessState> {
  BatimentsRepository? batimentsRepository;
  NewBusinessBloc({this.batimentsRepository}) : super(NewBusinessInitial()) {
    on<GetSousCategories>(_getSousCategories);
  }

  void _getSousCategories(
    GetSousCategories event,
    Emitter<NewBusinessState> emit,
  ) async {
    emit(PageLoading());
    await batimentsRepository!
        .getSousCategories()
        .then((value) => {emit(SousCategoriesLoaded(value.success!.data!))});
  }
}
