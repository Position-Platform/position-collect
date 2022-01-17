part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLocation extends HomeState {
  final Position position;

  const HomeLocation(this.position);

  @override
  List<Object> get props => [position];

  @override
  String toString() => 'HomeLocation { Location: $position }';
}

class HomeError extends HomeState {}
