/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:09 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 00:26:21
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

class SearchEtablissements extends MapEvent {
  final String query;

  const SearchEtablissements(this.query);

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'Query { Query: $query }';
}

class SetKeyBoardStatus extends MapEvent {
  final bool? keyboardStatus;

  const SetKeyBoardStatus(this.keyboardStatus);

  @override
  List<Object> get props => [keyboardStatus!];

  @override
  String toString() => 'KeyBoardStatus { KeyBoardStatus: $keyboardStatus }';
}
