/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 21:01:16 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 16:57:55
 */
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

class HomeNoInternet extends HomeState {}
