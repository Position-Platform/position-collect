/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 22:18:19 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-16 17:44:12
 */
part of 'new_business_bloc.dart';

abstract class NewBusinessEvent extends Equatable {
  const NewBusinessEvent();

  @override
  List<Object> get props => [];
}

class GetSousCategories extends NewBusinessEvent {
  const GetSousCategories();
  @override
  List<Object> get props => [];

  @override
  String toString() => 'GetSousCategories { }';
}

class FormPage1 extends NewBusinessEvent {
  final batiment.Data batiments;
  const FormPage1(this.batiments);
  @override
  List<Object> get props => [batiments];

  @override
  String toString() => 'FormPage1 { Batiments :$batiments}';
}

class AddBatiment extends NewBusinessEvent {
  final batiment.Data batiments;
  final String imagePath;
  const AddBatiment(this.batiments, this.imagePath);
  @override
  List<Object> get props => [batiments, imagePath];

  @override
  String toString() =>
      'AddBatiment { Batiments :$batiments,ImagePath: $imagePath}';
}

class AddEtablissement extends NewBusinessEvent {
  final etablissement.Data etablissements;
  final String coverPath;
  final int idSousCategorie;
  final String idCommodite;
  const AddEtablissement(this.etablissements, this.coverPath,
      this.idSousCategorie, this.idCommodite);
  @override
  List<Object> get props =>
      [etablissements, coverPath, idSousCategorie, idCommodite];

  @override
  String toString() =>
      'AddEtablissement { Etablissements :$etablissements,coverPath: $coverPath,idSousCategorie:$idSousCategorie,idCommodite:$idCommodite}';
}

class FormPage3 extends NewBusinessEvent {
  final etablissement.Data etablissements;
  final String coverPath;
  final int idSousCategorie;
  const FormPage3(this.etablissements, this.coverPath, this.idSousCategorie);
  @override
  List<Object> get props => [etablissements, coverPath, idSousCategorie];

  @override
  String toString() =>
      'FormPage3 { Etablissement :$etablissements,,coverPath: $coverPath,idSousCategorie:$idSousCategorie}';
}

class FormPage4 extends NewBusinessEvent {
  final etablissement.Data etablissements;
  final String coverPath;
  final int idSousCategorie;
  final String idCommodite;
  const FormPage4(this.etablissements, this.coverPath, this.idSousCategorie,
      this.idCommodite);
  @override
  List<Object> get props =>
      [etablissements, coverPath, idSousCategorie, idCommodite];

  @override
  String toString() =>
      'FormPage4 { Etablissement :$etablissements,,coverPath: $coverPath,idSousCategorie:$idSousCategorie,idCommodite:$idCommodite}';
}
