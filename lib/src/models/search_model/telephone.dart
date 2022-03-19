import 'package:json_annotation/json_annotation.dart';

part 'telephone.g.dart';

@JsonSerializable()
class Telephone {
  int? id;
  int? idEtablissement;
  String? numero;
  int? whatsapp;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  int? principal;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  Telephone({
    this.id,
    this.idEtablissement,
    this.numero,
    this.whatsapp,
    this.createdAt,
    this.updatedAt,
    this.principal,
    this.deletedAt,
  });

  @override
  String toString() {
    return 'Telephone(id: $id, idEtablissement: $idEtablissement, numero: $numero, whatsapp: $whatsapp, createdAt: $createdAt, updatedAt: $updatedAt, principal: $principal, deletedAt: $deletedAt)';
  }

  factory Telephone.fromJson(Map<String, dynamic> json) {
    return _$TelephoneFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TelephoneToJson(this);

  Telephone copyWith({
    int? id,
    int? idEtablissement,
    String? numero,
    int? whatsapp,
    String? createdAt,
    String? updatedAt,
    int? principal,
    dynamic deletedAt,
  }) {
    return Telephone(
      id: id ?? this.id,
      idEtablissement: idEtablissement ?? this.idEtablissement,
      numero: numero ?? this.numero,
      whatsapp: whatsapp ?? this.whatsapp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      principal: principal ?? this.principal,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
