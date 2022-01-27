import 'package:json_annotation/json_annotation.dart';

import 'commercial.dart';
import 'horaire.dart';
import 'image.dart';
import 'sous_category.dart';
import 'telephone.dart';

part 'etablissement.g.dart';

@JsonSerializable()
class Etablissement {
  int? id;
  int? idBatiment;
  String? nom;
  dynamic indicationAdresse;
  dynamic codePostal;
  String? siteInternet;
  int? idCommercial;
  dynamic idManager;
  int? etage;
  String? autres;
  String? cover;
  int? vues;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  dynamic description;
  int? revoir;
  int? valide;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  String? nomCommercial;
  @JsonKey(name: 'sous_categories')
  List<SousCategory>? sousCategories;
  List<Image>? images;
  List<Horaire>? horaires;
  List<Telephone>? telephones;
  Commercial? commercial;

  Etablissement({
    this.id,
    this.idBatiment,
    this.nom,
    this.indicationAdresse,
    this.codePostal,
    this.siteInternet,
    this.idCommercial,
    this.idManager,
    this.etage,
    this.autres,
    this.cover,
    this.vues,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.revoir,
    this.valide,
    this.deletedAt,
    this.nomCommercial,
    this.sousCategories,
    this.images,
    this.horaires,
    this.telephones,
    this.commercial,
  });

  @override
  String toString() {
    return 'Etablissement(id: $id, idBatiment: $idBatiment, nom: $nom, indicationAdresse: $indicationAdresse, codePostal: $codePostal, siteInternet: $siteInternet, idCommercial: $idCommercial, idManager: $idManager, etage: $etage, autres: $autres, cover: $cover, vues: $vues, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, revoir: $revoir, valide: $valide, deletedAt: $deletedAt, nomCommercial: $nomCommercial, sousCategories: $sousCategories, images: $images, horaires: $horaires, telephones: $telephones, commercial: $commercial)';
  }

  factory Etablissement.fromJson(Map<String, dynamic> json) {
    return _$EtablissementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EtablissementToJson(this);

  Etablissement copyWith({
    int? id,
    int? idBatiment,
    String? nom,
    dynamic indicationAdresse,
    dynamic codePostal,
    String? siteInternet,
    int? idCommercial,
    dynamic idManager,
    int? etage,
    String? autres,
    String? cover,
    int? vues,
    String? createdAt,
    String? updatedAt,
    dynamic description,
    int? revoir,
    int? valide,
    dynamic deletedAt,
    String? nomCommercial,
    List<SousCategory>? sousCategories,
    List<Image>? images,
    List<Horaire>? horaires,
    List<Telephone>? telephones,
    Commercial? commercial,
  }) {
    return Etablissement(
      id: id ?? this.id,
      idBatiment: idBatiment ?? this.idBatiment,
      nom: nom ?? this.nom,
      indicationAdresse: indicationAdresse ?? this.indicationAdresse,
      codePostal: codePostal ?? this.codePostal,
      siteInternet: siteInternet ?? this.siteInternet,
      idCommercial: idCommercial ?? this.idCommercial,
      idManager: idManager ?? this.idManager,
      etage: etage ?? this.etage,
      autres: autres ?? this.autres,
      cover: cover ?? this.cover,
      vues: vues ?? this.vues,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      revoir: revoir ?? this.revoir,
      valide: valide ?? this.valide,
      deletedAt: deletedAt ?? this.deletedAt,
      nomCommercial: nomCommercial ?? this.nomCommercial,
      sousCategories: sousCategories ?? this.sousCategories,
      images: images ?? this.images,
      horaires: horaires ?? this.horaires,
      telephones: telephones ?? this.telephones,
      commercial: commercial ?? this.commercial,
    );
  }
}
