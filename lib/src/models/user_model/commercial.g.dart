// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commercial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commercial _$CommercialFromJson(Map<String, dynamic> json) => Commercial(
      id: json['id'] as int?,
      idUser: json['idUser'] as int?,
      numeroCni: json['numeroCni'] as int?,
      numeroBadge: json['numeroBadge'] as int?,
      ville: json['ville'] as String?,
      quartier: json['quartier'] as String?,
      actif: json['actif'] as bool?,
      sexe: json['sexe'] as String?,
      whatsapp: json['whatsapp'] as int?,
      diplome: json['diplome'] as String?,
      tailleTshirt: json['tailleTshirt'] as String?,
      age: json['age'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CommercialToJson(Commercial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'numeroCni': instance.numeroCni,
      'numeroBadge': instance.numeroBadge,
      'ville': instance.ville,
      'quartier': instance.quartier,
      'actif': instance.actif,
      'sexe': instance.sexe,
      'whatsapp': instance.whatsapp,
      'diplome': instance.diplome,
      'tailleTshirt': instance.tailleTshirt,
      'age': instance.age,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
