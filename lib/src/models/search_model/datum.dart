import 'package:json_annotation/json_annotation.dart';
import 'package:positioncollect/src/models/batiments_model/sous_category.dart';

import 'batiment.dart';
import 'commercial.dart';
import 'horaire.dart';
import 'image.dart';
import 'telephone.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  int? idBatiment;
  String? nom;
  dynamic indicationAdresse;
  dynamic codePostal;
  dynamic siteInternet;
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
  Batiment? batiment;
  List<Image>? images;
  List<Horaire>? horaires;
  List<Telephone>? telephones;
  String? nomCommercial;
  @JsonKey(name: 'sous_categories')
  List<SousCategory>? sousCategories;
  Commercial? commercial;
  String? nomCategorie;
  @JsonKey(name: 'logo_url')
  String? logoUrl;

  Datum({
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
    this.batiment,
    this.images,
    this.horaires,
    this.telephones,
    this.nomCommercial,
    this.sousCategories,
    this.commercial,
    this.nomCategorie,
    this.logoUrl,
  });

  @override
  String toString() {
    return 'Datum(id: $id, idBatiment: $idBatiment, nom: $nom, indicationAdresse: $indicationAdresse, codePostal: $codePostal, siteInternet: $siteInternet, idCommercial: $idCommercial, idManager: $idManager, etage: $etage, autres: $autres, cover: $cover, vues: $vues, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, revoir: $revoir, valide: $valide, deletedAt: $deletedAt, batiment: $batiment, images: $images, horaires: $horaires, telephones: $telephones, nomCommercial: $nomCommercial, sousCategories: $sousCategories, commercial: $commercial, nomCategorie: $nomCategorie, logoUrl: $logoUrl)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    int? idBatiment,
    String? nom,
    dynamic indicationAdresse,
    dynamic codePostal,
    dynamic siteInternet,
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
    Batiment? batiment,
    List<Image>? images,
    List<Horaire>? horaires,
    List<Telephone>? telephones,
    String? nomCommercial,
    List<SousCategory>? sousCategories,
    Commercial? commercial,
    String? nomCategorie,
    String? logoUrl,
  }) {
    return Datum(
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
      batiment: batiment ?? this.batiment,
      images: images ?? this.images,
      horaires: horaires ?? this.horaires,
      telephones: telephones ?? this.telephones,
      nomCommercial: nomCommercial ?? this.nomCommercial,
      sousCategories: sousCategories ?? this.sousCategories,
      commercial: commercial ?? this.commercial,
      nomCategorie: nomCategorie ?? this.nomCategorie,
      logoUrl: logoUrl ?? this.logoUrl,
    );
  }
}
