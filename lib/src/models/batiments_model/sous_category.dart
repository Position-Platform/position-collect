import 'package:json_annotation/json_annotation.dart';

import 'categorie.dart';
import 'pivot.dart';

part 'sous_category.g.dart';

@JsonSerializable()
class SousCategory {
  int? id;
  String? nom;
  int? idCategorie;
  String? logoUrl;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Pivot? pivot;
  Categorie? categorie;

  SousCategory({
    this.id,
    this.nom,
    this.idCategorie,
    this.logoUrl,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.categorie,
  });

  @override
  String toString() {
    return 'SousCategory(id: $id, nom: $nom, idCategorie: $idCategorie, logoUrl: $logoUrl, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot, categorie: $categorie)';
  }

  factory SousCategory.fromJson(Map<String, dynamic> json) {
    return _$SousCategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SousCategoryToJson(this);

  SousCategory copyWith({
    int? id,
    String? nom,
    int? idCategorie,
    String? logoUrl,
    String? createdAt,
    String? updatedAt,
    Pivot? pivot,
    Categorie? categorie,
  }) {
    return SousCategory(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      idCategorie: idCategorie ?? this.idCategorie,
      logoUrl: logoUrl ?? this.logoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pivot: pivot ?? this.pivot,
      categorie: categorie ?? this.categorie,
    );
  }
}
