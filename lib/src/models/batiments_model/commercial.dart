/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:33:24 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-21 14:33:24 
 */
import 'package:json_annotation/json_annotation.dart';

part 'commercial.g.dart';

@JsonSerializable()
class Commercial {
  int? id;
  int? idUser;
  int? numeroCni;
  int? numeroBadge;
  String? ville;
  String? quartier;
  String? imageProfil;
  int? idZone;
  int? actif;
  String? sexe;
  String? whatsapp;
  String? diplome;
  String? tailleTshirt;
  int? age;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Commercial({
    this.id,
    this.idUser,
    this.numeroCni,
    this.numeroBadge,
    this.ville,
    this.quartier,
    this.imageProfil,
    this.idZone,
    this.actif,
    this.sexe,
    this.whatsapp,
    this.diplome,
    this.tailleTshirt,
    this.age,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Commercial(id: $id, idUser: $idUser, numeroCni: $numeroCni, numeroBadge: $numeroBadge, ville: $ville, quartier: $quartier, imageProfil: $imageProfil, idZone: $idZone, actif: $actif, sexe: $sexe, whatsapp: $whatsapp, diplome: $diplome, tailleTshirt: $tailleTshirt, age: $age, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Commercial.fromJson(Map<String, dynamic> json) {
    return _$CommercialFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommercialToJson(this);

  Commercial copyWith({
    int? id,
    int? idUser,
    int? numeroCni,
    int? numeroBadge,
    String? ville,
    String? quartier,
    String? imageProfil,
    int? idZone,
    int? actif,
    String? sexe,
    String? whatsapp,
    String? diplome,
    String? tailleTshirt,
    int? age,
    String? createdAt,
    String? updatedAt,
  }) {
    return Commercial(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      numeroCni: numeroCni ?? this.numeroCni,
      numeroBadge: numeroBadge ?? this.numeroBadge,
      ville: ville ?? this.ville,
      quartier: quartier ?? this.quartier,
      imageProfil: imageProfil ?? this.imageProfil,
      idZone: idZone ?? this.idZone,
      actif: actif ?? this.actif,
      sexe: sexe ?? this.sexe,
      whatsapp: whatsapp ?? this.whatsapp,
      diplome: diplome ?? this.diplome,
      tailleTshirt: tailleTshirt ?? this.tailleTshirt,
      age: age ?? this.age,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
