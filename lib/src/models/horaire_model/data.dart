import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? jour;
  String? plageHoraire;
  int? idEtablissement;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  int? id;

  Data({
    this.jour,
    this.plageHoraire,
    this.idEtablissement,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  @override
  String toString() {
    return 'Data(jour: $jour, plageHoraire: $plageHoraire, idEtablissement: $idEtablissement, updatedAt: $updatedAt, createdAt: $createdAt, id: $id)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? jour,
    String? plageHoraire,
    int? idEtablissement,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) {
    return Data(
      jour: jour ?? this.jour,
      plageHoraire: plageHoraire ?? this.plageHoraire,
      idEtablissement: idEtablissement ?? this.idEtablissement,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }
}
