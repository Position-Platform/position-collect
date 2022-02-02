/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:06 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-01 15:06:26
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
  final int batimentNumber;

  const BatimentsLoaded(this.batimentNumber);

  @override
  List<Object> get props => [batimentNumber];

  @override
  String toString() =>
      'Nombre de Batiments { Nombre de Batiments: $batimentNumber }';
}

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

class KeyBoardStatus extends MapState {
  final bool? keyboardStatus;

  const KeyBoardStatus(this.keyboardStatus);

  @override
  List<Object> get props => [keyboardStatus!];

  @override
  String toString() => 'KeyBoardStatus { KeyBoardStatus: $keyboardStatus }';
}

class UserAdress extends MapState {
  final String? adress;
  final Position? position;

  const UserAdress(this.adress, this.position);

  @override
  List<Object> get props => [adress!, position!];

  @override
  String toString() => 'Adress { Adress: $adress , Position: $position }';
}

class AdressLoading extends MapState {}

class AdressError extends MapState {}

class UrlPositionShared extends MapState {
  final String? url;

  const UrlPositionShared(this.url);

  @override
  List<Object> get props => [url!];

  @override
  String toString() => 'ShareUrl { ShareUrl: $url }';
}
