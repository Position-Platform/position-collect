/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 22:18:12 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-15 09:39:16
 */
part of 'new_business_bloc.dart';

abstract class NewBusinessState extends Equatable {
  const NewBusinessState();

  @override
  List<Object> get props => [];
}

class NewBusinessInitial extends NewBusinessState {}

class PageLoading extends NewBusinessState {}

class SousCategoriesLoading extends NewBusinessState {}

class SousCategoriesLoaded extends NewBusinessState {
  final List<Datum> sousCategories;

  const SousCategoriesLoaded(this.sousCategories);
  @override
  List<Object> get props => [sousCategories];

  @override
  String toString() =>
      'SousCategoriesLoaded { sousCategories: $sousCategories }';
}

class GoToPage2 extends NewBusinessState {
  final batiment.Data batiments;

  const GoToPage2(this.batiments);
  @override
  List<Object> get props => [batiments];

  @override
  String toString() => 'GoToPage2 { batiment: $batiments }';
}

class FormError extends NewBusinessState {}

class BatimentAdded extends NewBusinessState {
  final batiment.Data batiments;

  const BatimentAdded(this.batiments);
  @override
  List<Object> get props => [batiments];

  @override
  String toString() => 'BatimentAdded { batiment: $batiments }';
}

class Error extends NewBusinessState {
  final String error;

  const Error(this.error);
  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AddError { error: $error }';
}

class EtablissementAdded extends NewBusinessState {
  final etablissement.Data etablissements;

  const EtablissementAdded(this.etablissements);
  @override
  List<Object> get props => [etablissements];

  @override
  String toString() => 'EtablissementAdded { etablissement: $etablissements }';
}

class GoToPage4 extends NewBusinessState {
  final etablissement.Data etablissements;
  final String coverPath;
  final int idSousCategorie;
  const GoToPage4(this.etablissements, this.coverPath, this.idSousCategorie);
  @override
  List<Object> get props => [etablissements, coverPath, idSousCategorie];

  @override
  String toString() =>
      'GoToPage4 { etablissement: $etablissements ,coverPath: $coverPath,idSousCategorie:$idSousCategorie}';
}

class GoToPage5 extends NewBusinessState {
  final etablissement.Data etablissements;
  final String coverPath;
  final int idSousCategorie;
  final String idCommodite;
  const GoToPage5(this.etablissements, this.coverPath, this.idSousCategorie,
      this.idCommodite);
  @override
  List<Object> get props =>
      [etablissements, coverPath, idSousCategorie, idCommodite];

  @override
  String toString() =>
      'GoToPage4 { etablissement: $etablissements ,coverPath: $coverPath,idSousCategorie:$idSousCategorie,idCommodite:$idCommodite}';
}

class HorairesAdded extends NewBusinessState {}

class ImageAdded extends NewBusinessState {
  final Position position;

  const ImageAdded(this.position);

  @override
  List<Object> get props => [position];

  @override
  String toString() => 'ImageAdded { Location: $position }';
}
