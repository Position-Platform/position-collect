/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:09 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-24 11:58:07
 */
part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitializedEvent extends MapEvent {
  final MapboxMapController controller;

  const OnMapInitializedEvent(this.controller);
}

class ZoomInEvent extends MapEvent {}

class ZoomOutEvent extends MapEvent {}

class GetUserLocationEvent extends MapEvent {
  final Position position;

  const GetUserLocationEvent(this.position);
}

class UpdateStyleEvent extends MapEvent {
  final String style;

  const UpdateStyleEvent(this.style);
}

class StyleLoadingEvent extends MapEvent {}

class GetBatiments extends MapEvent {}

class ShowBatiments extends MapEvent {
  final String geojsonBatiments;

  const ShowBatiments(this.geojsonBatiments);

  @override
  List<Object> get props => [geojsonBatiments];

  @override
  String toString() => 'Batiments { Batiments: $geojsonBatiments }';
}
