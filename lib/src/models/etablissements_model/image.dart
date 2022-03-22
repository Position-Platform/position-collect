import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  int? id;
  int? idEtablissement;
  String? imageUrl;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Image({
    this.id,
    this.idEtablissement,
    this.imageUrl,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Image(id: $id, idEtablissement: $idEtablissement, imageUrl: $imageUrl, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  Image copyWith({
    int? id,
    int? idEtablissement,
    String? imageUrl,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return Image(
      id: id ?? this.id,
      idEtablissement: idEtablissement ?? this.idEtablissement,
      imageUrl: imageUrl ?? this.imageUrl,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
