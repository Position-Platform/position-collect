/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:06 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-24 12:08:07
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

class BatimentsLoaded extends MapState {
  final String geojsonBatiments;

  const BatimentsLoaded(this.geojsonBatiments);

  @override
  List<Object> get props => [geojsonBatiments];

  @override
  String toString() => 'Batiments { Batiments: $geojsonBatiments }';
}
