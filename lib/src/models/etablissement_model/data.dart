import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? nom;
  String? indicationAdresse;
  String? codePostal;
  String? siteInternet;
  String? etage;
  String? phone;
  String? whatsapp1;
  String? whatsapp2;
  String? description;
  String? osmId;
  String? services;
  String? ameliorations;
  int? idUser;
  String? cover;
  int? idCommercial;
  int? idBatiment;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  int? id;

  Data({
    this.nom,
    this.indicationAdresse,
    this.codePostal,
    this.siteInternet,
    this.etage,
    this.phone,
    this.whatsapp1,
    this.whatsapp2,
    this.description,
    this.osmId,
    this.services,
    this.ameliorations,
    this.idUser,
    this.cover,
    this.idCommercial,
    this.idBatiment,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  @override
  String toString() {
    return 'Data(nom: $nom, indicationAdresse: $indicationAdresse, codePostal: $codePostal, siteInternet: $siteInternet, etage: $etage, phone: $phone, whatsapp1: $whatsapp1, whatsapp2: $whatsapp2, description: $description, osmId: $osmId, services: $services, ameliorations: $ameliorations, idUser: $idUser, cover: $cover, idCommercial: $idCommercial, idBatiment: $idBatiment, updatedAt: $updatedAt, createdAt: $createdAt, id: $id)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? nom,
    String? indicationAdresse,
    String? codePostal,
    String? siteInternet,
    String? etage,
    String? phone,
    String? whatsapp1,
    String? whatsapp2,
    String? description,
    String? osmId,
    String? services,
    String? ameliorations,
    int? idUser,
    String? cover,
    int? idCommercial,
    int? idBatiment,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) {
    return Data(
      nom: nom ?? this.nom,
      indicationAdresse: indicationAdresse ?? this.indicationAdresse,
      codePostal: codePostal ?? this.codePostal,
      siteInternet: siteInternet ?? this.siteInternet,
      etage: etage ?? this.etage,
      phone: phone ?? this.phone,
      whatsapp1: whatsapp1 ?? this.whatsapp1,
      whatsapp2: whatsapp2 ?? this.whatsapp2,
      description: description ?? this.description,
      osmId: osmId ?? this.osmId,
      services: services ?? this.services,
      ameliorations: ameliorations ?? this.ameliorations,
      idUser: idUser ?? this.idUser,
      cover: cover ?? this.cover,
      idCommercial: idCommercial ?? this.idCommercial,
      idBatiment: idBatiment ?? this.idBatiment,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }
}
