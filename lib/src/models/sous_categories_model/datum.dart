import 'package:json_annotation/json_annotation.dart';

import 'categorie.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? nom;
  int? idcategorie;
  dynamic logourl;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Categorie? categorie;

  Datum({
    this.id,
    this.nom,
    this.idcategorie,
    this.logourl,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.categorie,
  });

  @override
  String toString() {
    return 'Datum(id: $id, nom: $nom, idcategorie: $idcategorie, logourl: $logourl, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, categorie: $categorie)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    String? nom,
    int? idcategorie,
    dynamic logourl,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
    Categorie? categorie,
  }) {
    return Datum(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      idcategorie: idcategorie ?? this.idcategorie,
      logourl: logourl ?? this.logourl,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      categorie: categorie ?? this.categorie,
    );
  }
}
