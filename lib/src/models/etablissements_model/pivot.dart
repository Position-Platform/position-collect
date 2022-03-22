import 'package:json_annotation/json_annotation.dart';

part 'pivot.g.dart';

@JsonSerializable()
class Pivot {
  int? idEtablissement;
  int? idSousCategorie;

  Pivot({this.idEtablissement, this.idSousCategorie});

  @override
  String toString() {
    return 'Pivot(idEtablissement: $idEtablissement, idSousCategorie: $idSousCategorie)';
  }

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);

  Pivot copyWith({
    int? idEtablissement,
    int? idSousCategorie,
  }) {
    return Pivot(
      idEtablissement: idEtablissement ?? this.idEtablissement,
      idSousCategorie: idSousCategorie ?? this.idSousCategorie,
    );
  }
}
