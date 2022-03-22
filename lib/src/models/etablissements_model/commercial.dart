import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'commercial.g.dart';

@JsonSerializable()
class Commercial {
  int? id;
  int? idUser;
  int? numeroCni;
  int? numeroBadge;
  String? ville;
  String? quartier;
  bool? actif;
  String? sexe;
  int? whatsapp;
  String? diplome;
  String? tailleTshirt;
  int? age;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  User? user;

  Commercial({
    this.id,
    this.idUser,
    this.numeroCni,
    this.numeroBadge,
    this.ville,
    this.quartier,
    this.actif,
    this.sexe,
    this.whatsapp,
    this.diplome,
    this.tailleTshirt,
    this.age,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  @override
  String toString() {
    return 'Commercial(id: $id, idUser: $idUser, numeroCni: $numeroCni, numeroBadge: $numeroBadge, ville: $ville, quartier: $quartier, actif: $actif, sexe: $sexe, whatsapp: $whatsapp, diplome: $diplome, tailleTshirt: $tailleTshirt, age: $age, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
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
    bool? actif,
    String? sexe,
    int? whatsapp,
    String? diplome,
    String? tailleTshirt,
    int? age,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
    User? user,
  }) {
    return Commercial(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      numeroCni: numeroCni ?? this.numeroCni,
      numeroBadge: numeroBadge ?? this.numeroBadge,
      ville: ville ?? this.ville,
      quartier: quartier ?? this.quartier,
      actif: actif ?? this.actif,
      sexe: sexe ?? this.sexe,
      whatsapp: whatsapp ?? this.whatsapp,
      diplome: diplome ?? this.diplome,
      tailleTshirt: tailleTshirt ?? this.tailleTshirt,
      age: age ?? this.age,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
    );
  }
}
