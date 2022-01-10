/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:02:08 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:02:08 
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
  String? zone;
  int? actif;
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
    this.zone,
    this.actif,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Commercial(id: $id, idUser: $idUser, numeroCni: $numeroCni, numeroBadge: $numeroBadge, ville: $ville, quartier: $quartier, imageProfil: $imageProfil, zone: $zone, actif: $actif, createdAt: $createdAt, updatedAt: $updatedAt)';
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
    String? zone,
    int? actif,
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
      zone: zone ?? this.zone,
      actif: actif ?? this.actif,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
