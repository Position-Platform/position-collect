/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 22:18:25 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-02-09 22:18:25 
 */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_business_event.dart';
part 'new_business_state.dart';

class NewBusinessBloc extends Bloc<NewBusinessEvent, NewBusinessState> {
  NewBusinessBloc() : super(const NewBusinessInitial(0, 4)) {
    on<StepTapped>(_stepTapped);
    on<StepCancelled>(_stepCancelled);
    on<StepContinue>(_stepContinue);
  }

  void _stepTapped(StepTapped event, Emitter<NewBusinessState> emit) {
    emit(StepperTapped(event.step));
  }

  void _stepCancelled(StepCancelled event, Emitter<NewBusinessState> emit) {
    emit(StepperTapped(event.step - 1 >= 0 ? event.step - 1 : 0));
  }

  void _stepContinue(StepContinue event, Emitter<NewBusinessState> emit) {
    emit(StepperTapped(event.step + 1 < 4 ? event.step + 1 : 0));
  }
}
