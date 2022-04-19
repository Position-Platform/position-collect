part of 'edit_business_bloc.dart';

abstract class EditBusinessState extends Equatable {
  const EditBusinessState();

  @override
  List<Object> get props => [];
}

class EditBusinessInitial extends EditBusinessState {}

class EditBusinessLoading extends EditBusinessState {}

class EditBusinessError extends EditBusinessState {}

class BatimentUpdated extends EditBusinessState {
  final Data batiment;
  const BatimentUpdated(this.batiment);
  @override
  List<Object> get props => [batiment];

  @override
  String toString() => 'BatimentUpdated { Batiment :$batiment}';
}

class EtablissementUpdated extends EditBusinessState {
  final etablissement.Data etab;
  const EtablissementUpdated(this.etab);

  @override
  List<Object> get props => [etab];

  @override
  String toString() => 'EtablissementUpdated { Etablissement :$etab}';
}
