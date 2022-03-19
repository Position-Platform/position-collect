import 'package:json_annotation/json_annotation.dart';

part 'categorie.g.dart';

@JsonSerializable()
class Categorie {
  int? id;
  String? nom;
  dynamic logourl;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Categorie({
    this.id,
    this.nom,
    this.logourl,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Categorie(id: $id, nom: $nom, logourl: $logourl, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return _$CategorieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategorieToJson(this);

  Categorie copyWith({
    int? id,
    String? nom,
    dynamic logourl,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return Categorie(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      logourl: logourl ?? this.logourl,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
