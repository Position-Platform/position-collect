import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? longitude;
  String? latitude;
  int? idUser;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  int? id;

  Data({
    this.longitude,
    this.latitude,
    this.idUser,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  @override
  String toString() {
    return 'Data(longitude: $longitude, latitude: $latitude, idUser: $idUser, updatedAt: $updatedAt, createdAt: $createdAt, id: $id)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? longitude,
    String? latitude,
    int? idUser,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) {
    return Data(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      idUser: idUser ?? this.idUser,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }
}
