// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categorie _$CategorieFromJson(Map<String, dynamic> json) => Categorie(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      logourl: json['logourl'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      commodites: (json['commodites'] as List<dynamic>?)
          ?.map((e) => Commodite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategorieToJson(Categorie instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'logourl': instance.logourl,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'commodites': instance.commodites,
    };
