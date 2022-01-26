// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sous_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SousCategory _$SousCategoryFromJson(Map<String, dynamic> json) => SousCategory(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      idCategorie: json['idCategorie'] as int?,
      logoUrl: json['logoUrl'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
      categorie: json['categorie'] == null
          ? null
          : Categorie.fromJson(json['categorie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SousCategoryToJson(SousCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'idCategorie': instance.idCategorie,
      'logoUrl': instance.logoUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'pivot': instance.pivot,
      'categorie': instance.categorie,
    };
