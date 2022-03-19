import 'package:json_annotation/json_annotation.dart';

part 'pivot.g.dart';

@JsonSerializable()
class Pivot {
  int? idCategorie;
  int? idCommodite;

  Pivot({this.idCategorie, this.idCommodite});

  @override
  String toString() {
    return 'Pivot(idCategorie: $idCategorie, idCommodite: $idCommodite)';
  }

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);

  Pivot copyWith({
    int? idCategorie,
    int? idCommodite,
  }) {
    return Pivot(
      idCategorie: idCategorie ?? this.idCategorie,
      idCommodite: idCommodite ?? this.idCommodite,
    );
  }
}
