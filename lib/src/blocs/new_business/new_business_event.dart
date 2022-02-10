/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 22:18:19 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-02-09 22:18:19 
 */
part of 'new_business_bloc.dart';

abstract class NewBusinessEvent extends Equatable {
  const NewBusinessEvent();

  @override
  List<Object> get props => [];
}

class StepTapped extends NewBusinessEvent {
  final int step;

  const StepTapped(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'StepTapped { step: $step }';
}

class StepCancelled extends NewBusinessEvent {
  final int step;

  const StepCancelled(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'StepCancelled { step: $step }';
}

class StepContinue extends NewBusinessEvent {
  final int step;

  const StepContinue(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'StepContinue { step: $step }';
}
