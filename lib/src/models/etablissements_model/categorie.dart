import 'package:json_annotation/json_annotation.dart';

part 'categorie.g.dart';

@JsonSerializable()
class Categorie {
  int? id;
  String? nom;
  String? shortname;
  String? logourl;
  int? vues;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Categorie({
    this.id,
    this.nom,
    this.shortname,
    this.logourl,
    this.vues,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Categorie(id: $id, nom: $nom, shortname: $shortname, logourl: $logourl, vues: $vues, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return _$CategorieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategorieToJson(this);

  Categorie copyWith({
    int? id,
    String? nom,
    String? shortname,
    String? logourl,
    int? vues,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return Categorie(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      shortname: shortname ?? this.shortname,
      logourl: logourl ?? this.logourl,
      vues: vues ?? this.vues,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
