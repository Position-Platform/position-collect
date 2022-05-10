// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commodite _$CommoditeFromJson(Map<String, dynamic> json) => Commodite(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      idTypeCommodite: json['idTypeCommodite'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommoditeToJson(Commodite instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'idTypeCommodite': instance.idTypeCommodite,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'pivot': instance.pivot,
    };
