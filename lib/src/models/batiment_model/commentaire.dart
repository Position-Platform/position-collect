import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'commentaire.g.dart';

@JsonSerializable()
class Commentaire {
  int? id;
  int? idUser;
  int? idEtablissement;
  String? commentaire;
  int? rating;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  User? user;

  Commentaire({
    this.id,
    this.idUser,
    this.idEtablissement,
    this.commentaire,
    this.rating,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  @override
  String toString() {
    return 'Commentaire(id: $id, idUser: $idUser, idEtablissement: $idEtablissement, commentaire: $commentaire, rating: $rating, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }

  factory Commentaire.fromJson(Map<String, dynamic> json) {
    return _$CommentaireFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommentaireToJson(this);

  Commentaire copyWith({
    int? id,
    int? idUser,
    int? idEtablissement,
    String? commentaire,
    int? rating,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
    User? user,
  }) {
    return Commentaire(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      idEtablissement: idEtablissement ?? this.idEtablissement,
      commentaire: commentaire ?? this.commentaire,
      rating: rating ?? this.rating,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
    );
  }
}
