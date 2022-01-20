/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 21:01:21 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-20 21:01:21 
 */
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeGetLocation extends HomeEvent {}
