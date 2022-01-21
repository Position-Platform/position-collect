/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:33:45 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-21 14:33:45 
 */
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  int? id;
  String? idEtablissement;
  String? imageUrl;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  Image({
    this.id,
    this.idEtablissement,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  String toString() {
    return 'Image(id: $id, idEtablissement: $idEtablissement, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  Image copyWith({
    int? id,
    String? idEtablissement,
    String? imageUrl,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) {
    return Image(
      id: id ?? this.id,
      idEtablissement: idEtablissement ?? this.idEtablissement,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
