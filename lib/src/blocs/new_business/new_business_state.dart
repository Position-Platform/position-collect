/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 22:18:12 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-02-09 22:18:12 
 */
part of 'new_business_bloc.dart';

abstract class NewBusinessState extends Equatable {
  const NewBusinessState();

  @override
  List<Object> get props => [];
}

class NewBusinessInitial extends NewBusinessState {
  final int step;
  final int maxSteps;

  const NewBusinessInitial(this.step, this.maxSteps);
  @override
  List<Object> get props => [step, maxSteps];

  @override
  String toString() => 'StepperState { step: $step, maxSteps:$maxSteps }';
}

class StepperTapped extends NewBusinessState {
  final int step;

  const StepperTapped(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'StepperTapped { step: $step }';
}
