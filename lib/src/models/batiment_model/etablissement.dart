import 'package:json_annotation/json_annotation.dart';

import 'commentaire.dart';
import 'commercial.dart';
import 'commodite.dart';
import 'horaire.dart';
import 'image.dart';
import 'sous_category.dart';

part 'etablissement.g.dart';

@JsonSerializable()
class Etablissement {
  int? id;
  String? nom;
  String? idBatiment;
  dynamic indicationAdresse;
  dynamic codePostal;
  dynamic siteInternet;
  String? idCommercial;
  dynamic idManager;
  String? etage;
  String? cover;
  String? vues;
  String? phone;
  String? whatsapp1;
  dynamic whatsapp2;
  dynamic description;
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
  dynamic idUser;
  dynamic logo;
  dynamic manager;
  dynamic user;
  Commercial? commercial;
  @JsonKey(name: 'sous_categories')
  List<SousCategory>? sousCategories;
  List<Commodite>? commodites;
  List<Horaire>? horaires;
  List<Image>? images;
  List<Commentaire>? commentaires;

  Etablissement({
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
    this.manager,
    this.user,
    this.commercial,
    this.sousCategories,
    this.commodites,
    this.horaires,
    this.images,
    this.commentaires,
  });

  @override
  String toString() {
    return 'Etablissement(id: $id, nom: $nom, idBatiment: $idBatiment, indicationAdresse: $indicationAdresse, codePostal: $codePostal, siteInternet: $siteInternet, idCommercial: $idCommercial, idManager: $idManager, etage: $etage, cover: $cover, vues: $vues, phone: $phone, whatsapp1: $whatsapp1, whatsapp2: $whatsapp2, description: $description, osmId: $osmId, updated: $updated, revoir: $revoir, valide: $valide, services: $services, ameliorations: $ameliorations, avis: $avis, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, idUser: $idUser, logo: $logo, manager: $manager, user: $user, commercial: $commercial, sousCategories: $sousCategories, commodites: $commodites, horaires: $horaires, images: $images, commentaires: $commentaires)';
  }

  factory Etablissement.fromJson(Map<String, dynamic> json) {
    return _$EtablissementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EtablissementToJson(this);

  Etablissement copyWith({
    int? id,
    String? nom,
    String? idBatiment,
    dynamic indicationAdresse,
    dynamic codePostal,
    dynamic siteInternet,
    String? idCommercial,
    dynamic idManager,
    String? etage,
    String? cover,
    String? vues,
    String? phone,
    String? whatsapp1,
    dynamic whatsapp2,
    dynamic description,
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
    dynamic idUser,
    dynamic logo,
    dynamic manager,
    dynamic user,
    Commercial? commercial,
    List<SousCategory>? sousCategories,
    List<Commodite>? commodites,
    List<Horaire>? horaires,
    List<Image>? images,
    List<Commentaire>? commentaires,
  }) {
    return Etablissement(
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
      manager: manager ?? this.manager,
      user: user ?? this.user,
      commercial: commercial ?? this.commercial,
      sousCategories: sousCategories ?? this.sousCategories,
      commodites: commodites ?? this.commodites,
      horaires: horaires ?? this.horaires,
      images: images ?? this.images,
      commentaires: commentaires ?? this.commentaires,
    );
  }
}
