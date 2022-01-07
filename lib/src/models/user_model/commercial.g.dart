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
      imageProfil: json['imageProfil'] as String?,
      zone: json['zone'] as String?,
      actif: json['actif'] as int?,
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
      'imageProfil': instance.imageProfil,
      'zone': instance.zone,
      'actif': instance.actif,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
