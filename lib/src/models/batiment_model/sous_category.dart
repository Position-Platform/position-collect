import 'package:json_annotation/json_annotation.dart';

import 'categorie.dart';
import 'pivot.dart';

part 'sous_category.g.dart';

@JsonSerializable()
class SousCategory {
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
  Pivot? pivot;
  Categorie? categorie;

  SousCategory({
    this.id,
    this.nom,
    this.idcategorie,
    this.logourl,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.categorie,
  });

  @override
  String toString() {
    return 'SousCategory(id: $id, nom: $nom, idcategorie: $idcategorie, logourl: $logourl, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot, categorie: $categorie)';
  }

  factory SousCategory.fromJson(Map<String, dynamic> json) {
    return _$SousCategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SousCategoryToJson(this);

  SousCategory copyWith({
    int? id,
    String? nom,
    int? idcategorie,
    dynamic logourl,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
    Pivot? pivot,
    Categorie? categorie,
  }) {
    return SousCategory(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      idcategorie: idcategorie ?? this.idcategorie,
      logourl: logourl ?? this.logourl,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pivot: pivot ?? this.pivot,
      categorie: categorie ?? this.categorie,
    );
  }
}
