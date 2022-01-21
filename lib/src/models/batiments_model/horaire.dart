/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:33:41 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-21 14:33:41 
 */
import 'package:json_annotation/json_annotation.dart';

part 'horaire.g.dart';

@JsonSerializable()
class Horaire {
  int? id;
  int? idEtablissement;
  String? jour;
  int? ouvert;
  String? heureOuverture;
  String? heureFermeture;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  Horaire({
    this.id,
    this.idEtablissement,
    this.jour,
    this.ouvert,
    this.heureOuverture,
    this.heureFermeture,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  String toString() {
    return 'Horaire(id: $id, idEtablissement: $idEtablissement, jour: $jour, ouvert: $ouvert, heureOuverture: $heureOuverture, heureFermeture: $heureFermeture, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  factory Horaire.fromJson(Map<String, dynamic> json) {
    return _$HoraireFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HoraireToJson(this);

  Horaire copyWith({
    int? id,
    int? idEtablissement,
    String? jour,
    int? ouvert,
    String? heureOuverture,
    String? heureFermeture,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) {
    return Horaire(
      id: id ?? this.id,
      idEtablissement: idEtablissement ?? this.idEtablissement,
      jour: jour ?? this.jour,
      ouvert: ouvert ?? this.ouvert,
      heureOuverture: heureOuverture ?? this.heureOuverture,
      heureFermeture: heureFermeture ?? this.heureFermeture,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
