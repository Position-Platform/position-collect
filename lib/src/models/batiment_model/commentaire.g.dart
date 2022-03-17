// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commentaire _$CommentaireFromJson(Map<String, dynamic> json) => Commentaire(
      id: json['id'] as int?,
      idUser: json['idUser'] as int?,
      idEtablissement: json['idEtablissement'] as int?,
      commentaire: json['commentaire'] as String?,
      rating: json['rating'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentaireToJson(Commentaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'idEtablissement': instance.idEtablissement,
      'commentaire': instance.commentaire,
      'rating': instance.rating,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user': instance.user,
    };
