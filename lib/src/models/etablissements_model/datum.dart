import 'package:json_annotation/json_annotation.dart';

import 'batiment.dart';
import 'commercial.dart';
import 'horaire.dart';
import 'image.dart';
import 'sous_category.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? nom;
  String? idBatiment;
  String? indicationAdresse;
  String? codePostal;
  String? siteInternet;
  String? idCommercial;
  dynamic idManager;
  String? idUser;
  String? etage;
  String? cover;
  String? vues;
  String? phone;
  String? whatsapp1;
  String? whatsapp2;
  String? description;
  dynamic osmId;
  bool? updated;
  String? revoir;
  String? valide;
  String? services;
  String? ameliorations;
  int? avis;
  dynamic logo;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Batiment? batiment;
  @JsonKey(name: 'sous_categories')
  List<SousCategory>? sousCategories;
  List<dynamic>? commodites;
  List<Image>? images;
  List<Horaire>? horaires;
  List<dynamic>? commentaires;
  Commercial? commercial;
  dynamic manager;

  Datum({
    this.id,
    this.nom,
    this.idBatiment,
    this.indicationAdresse,
    this.codePostal,
    this.siteInternet,
    this.idCommercial,
    this.idManager,
    this.idUser,
    this.etage,
    this.cover,
    this.vues,
    this.phone,
    this.whatsapp1,
    this.whatsapp2,
    this.description,
    this.osmId,
    this.updated,
    this.revoir,
    this.valide,
    this.services,
    this.ameliorations,
    this.avis,
    this.logo,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.batiment,
    this.sousCategories,
    this.commodites,
    this.images,
    this.horaires,
    this.commentaires,
    this.commercial,
    this.manager,
  });

  @override
  String toString() {
    return 'Datum(id: $id, nom: $nom, idBatiment: $idBatiment, indicationAdresse: $indicationAdresse, codePostal: $codePostal, siteInternet: $siteInternet, idCommercial: $idCommercial, idManager: $idManager, idUser: $idUser, etage: $etage, cover: $cover, vues: $vues, phone: $phone, whatsapp1: $whatsapp1, whatsapp2: $whatsapp2, description: $description, osmId: $osmId, updated: $updated, revoir: $revoir, valide: $valide, services: $services, ameliorations: $ameliorations, avis: $avis, logo: $logo, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, batiment: $batiment, sousCategories: $sousCategories, commodites: $commodites, images: $images, horaires: $horaires, commentaires: $commentaires, commercial: $commercial, manager: $manager)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    String? nom,
    String? idBatiment,
    String? indicationAdresse,
    String? codePostal,
    String? siteInternet,
    String? idCommercial,
    dynamic idManager,
    String? idUser,
    String? etage,
    String? cover,
    String? vues,
    String? phone,
    String? whatsapp1,
    String? whatsapp2,
    String? description,
    dynamic osmId,
    bool? updated,
    String? revoir,
    String? valide,
    String? services,
    String? ameliorations,
    int? avis,
    dynamic logo,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
    Batiment? batiment,
    List<SousCategory>? sousCategories,
    List<dynamic>? commodites,
    List<Image>? images,
    List<Horaire>? horaires,
    List<dynamic>? commentaires,
    Commercial? commercial,
    dynamic manager,
  }) {
    return Datum(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      idBatiment: idBatiment ?? this.idBatiment,
      indicationAdresse: indicationAdresse ?? this.indicationAdresse,
      codePostal: codePostal ?? this.codePostal,
      siteInternet: siteInternet ?? this.siteInternet,
      idCommercial: idCommercial ?? this.idCommercial,
      idManager: idManager ?? this.idManager,
      idUser: idUser ?? this.idUser,
      etage: etage ?? this.etage,
      cover: cover ?? this.cover,
      vues: vues ?? this.vues,
      phone: phone ?? this.phone,
      whatsapp1: whatsapp1 ?? this.whatsapp1,
      whatsapp2: whatsapp2 ?? this.whatsapp2,
      description: description ?? this.description,
      osmId: osmId ?? this.osmId,
      updated: updated ?? this.updated,
      revoir: revoir ?? this.revoir,
      valide: valide ?? this.valide,
      services: services ?? this.services,
      ameliorations: ameliorations ?? this.ameliorations,
      avis: avis ?? this.avis,
      logo: logo ?? this.logo,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      batiment: batiment ?? this.batiment,
      sousCategories: sousCategories ?? this.sousCategories,
      commodites: commodites ?? this.commodites,
      images: images ?? this.images,
      horaires: horaires ?? this.horaires,
      commentaires: commentaires ?? this.commentaires,
      commercial: commercial ?? this.commercial,
      manager: manager ?? this.manager,
    );
  }
}
