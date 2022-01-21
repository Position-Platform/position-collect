/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:33:20 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-21 14:33:20 
 */
import 'package:json_annotation/json_annotation.dart';

part 'categorie.g.dart';

@JsonSerializable()
class Categorie {
  int? id;
  String? nom;
  String? logoUrl;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Categorie({
    this.id,
    this.nom,
    this.logoUrl,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Categorie(id: $id, nom: $nom, logoUrl: $logoUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return _$CategorieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategorieToJson(this);

  Categorie copyWith({
    int? id,
    String? nom,
    String? logoUrl,
    String? createdAt,
    String? updatedAt,
  }) {
    return Categorie(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      logoUrl: logoUrl ?? this.logoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
