// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categorie _$CategorieFromJson(Map<String, dynamic> json) => Categorie(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      logoUrl: json['logoUrl'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CategorieToJson(Categorie instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'logoUrl': instance.logoUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
