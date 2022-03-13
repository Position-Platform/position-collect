import 'package:json_annotation/json_annotation.dart';

part 'horaire.g.dart';

@JsonSerializable()
class Horaire {
  int? id;
  int? idEtablissement;
  String? jour;
  String? plageHoraire;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Horaire({
    this.id,
    this.idEtablissement,
    this.jour,
    this.plageHoraire,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Horaire(id: $id, idEtablissement: $idEtablissement, jour: $jour, plageHoraire: $plageHoraire, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Horaire.fromJson(Map<String, dynamic> json) {
    return _$HoraireFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HoraireToJson(this);

  Horaire copyWith({
    int? id,
    int? idEtablissement,
    String? jour,
    String? plageHoraire,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return Horaire(
      id: id ?? this.id,
      idEtablissement: idEtablissement ?? this.idEtablissement,
      jour: jour ?? this.jour,
      plageHoraire: plageHoraire ?? this.plageHoraire,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
