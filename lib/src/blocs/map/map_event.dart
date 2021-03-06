/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:09 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-21 17:09:06
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

class GetUserLocationEvent extends MapEvent {}

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

class GetUserAdress extends MapEvent {}

class SharePosition extends MapEvent {
  final String? position;

  const SharePosition(this.position);

  @override
  List<Object> get props => [position!];

  @override
  String toString() => 'SharePosition { SharePosition: $position }';
}

class NewBatiment extends MapEvent {
  final LatLng? latLng;

  const NewBatiment(this.latLng);

  @override
  List<Object> get props => [latLng!];

  @override
  String toString() => 'NewBatiment { NewBatiment: $latLng }';
}

class RemoveMarker extends MapEvent {}

class GetBatiment extends MapEvent {
  final batiment.Data? bati;

  const GetBatiment(this.bati);

  @override
  List<Object> get props => [bati!];

  @override
  String toString() => 'GetBatiment { GetBatiment: $bati }';
}

class ZoomInSearchResult extends MapEvent {
  final String? longitude;
  final String? latitude;

  const ZoomInSearchResult(this.longitude, this.latitude);

  @override
  List<Object> get props => [longitude!, latitude!];

  @override
  String toString() =>
      'ZoomInSearchResult { Longitude: $longitude, Latitude: $latitude }';
}
