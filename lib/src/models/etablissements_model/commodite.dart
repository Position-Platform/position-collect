import 'package:json_annotation/json_annotation.dart';

import 'pivot.dart';

part 'commodite.g.dart';

@JsonSerializable()
class Commodite {
  int? id;
  String? nom;
  int? idTypeCommodite;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  dynamic createdAt;
  @JsonKey(name: 'updated_at')
  dynamic updatedAt;
  Pivot? pivot;

  Commodite({
    this.id,
    this.nom,
    this.idTypeCommodite,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  @override
  String toString() {
    return 'Commodite(id: $id, nom: $nom, idTypeCommodite: $idTypeCommodite, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot)';
  }

  factory Commodite.fromJson(Map<String, dynamic> json) {
    return _$CommoditeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommoditeToJson(this);

  Commodite copyWith({
    int? id,
    String? nom,
    int? idTypeCommodite,
    dynamic deletedAt,
    dynamic createdAt,
    dynamic updatedAt,
    Pivot? pivot,
  }) {
    return Commodite(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      idTypeCommodite: idTypeCommodite ?? this.idTypeCommodite,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pivot: pivot ?? this.pivot,
    );
  }
}
