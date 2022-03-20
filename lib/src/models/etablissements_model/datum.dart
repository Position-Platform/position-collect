import 'package:json_annotation/json_annotation.dart';

import 'batiment.dart';
import 'commercial.dart';
import 'commodite.dart';
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
  String? etage;
  String? cover;
  String? vues;
  String? phone;
  String? whatsapp1;
  dynamic whatsapp2;
  String? description;
  dynamic osmId;
  bool? updated;
  String? revoir;
  String? valide;
  String? services;
  dynamic ameliorations;
  int? avis;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  int? idUser;
  dynamic logo;
  Batiment? batiment;
  @JsonKey(name: 'sous_categories')
  List<SousCategory>? sousCategories;
  List<Commodite>? commodites;
  List<dynamic>? images;
  List<dynamic>? horaires;
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
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.idUser,
    this.logo,
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
    return 'Datum(id: $id, nom: $nom, idBatiment: $idBatiment, indicationAdresse: $indicationAdresse, codePostal: $codePostal, siteInternet: $siteInternet, idCommercial: $idCommercial, idManager: $idManager, etage: $etage, cover: $cover, vues: $vues, phone: $phone, whatsapp1: $whatsapp1, whatsapp2: $whatsapp2, description: $description, osmId: $osmId, updated: $updated, revoir: $revoir, valide: $valide, services: $services, ameliorations: $ameliorations, avis: $avis, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, idUser: $idUser, logo: $logo, batiment: $batiment, sousCategories: $sousCategories, commodites: $commodites, images: $images, horaires: $horaires, commentaires: $commentaires, commercial: $commercial, manager: $manager)';
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
    String? etage,
    String? cover,
    String? vues,
    String? phone,
    String? whatsapp1,
    dynamic whatsapp2,
    String? description,
    dynamic osmId,
    bool? updated,
    String? revoir,
    String? valide,
    String? services,
    dynamic ameliorations,
    int? avis,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
    int? idUser,
    dynamic logo,
    Batiment? batiment,
    List<SousCategory>? sousCategories,
    List<Commodite>? commodites,
    List<dynamic>? images,
    List<dynamic>? horaires,
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
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      idUser: idUser ?? this.idUser,
      logo: logo ?? this.logo,
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
