part of 'batiment_bloc.dart';

abstract class BatimentState extends Equatable {
  const BatimentState();
  
  @override
  List<Object> get props => [];
}

class BatimentInitial extends BatimentState {}
