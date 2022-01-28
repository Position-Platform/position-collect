/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:06 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 00:37:52
 */
part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class UpdateStyle extends MapState {
  final String style;

  const UpdateStyle(this.style);

  @override
  List<Object> get props => [style];

  @override
  String toString() => 'Style { Style: $style }';
}

class StyleLoaded extends MapState {}

class BatimentsLoaded extends MapState {}

class BatimentsLoading extends MapState {}

class BatimentsLoadingError extends MapState {}

class SearchLoading extends MapState {}

class SearchError extends MapState {}

class SearchComplete extends MapState {
  final List<Datum>? etablissements;

  const SearchComplete(this.etablissements);

  @override
  List<Object> get props => [etablissements!];

  @override
  String toString() => 'Etablissements { Etablissements: $etablissements }';
}
