// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telephone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Telephone _$TelephoneFromJson(Map<String, dynamic> json) => Telephone(
      id: json['id'] as int?,
      idEtablissement: json['idEtablissement'] as int?,
      numero: json['numero'] as String?,
      whatsapp: json['whatsapp'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      principal: json['principal'] as int?,
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$TelephoneToJson(Telephone instance) => <String, dynamic>{
      'id': instance.id,
      'idEtablissement': instance.idEtablissement,
      'numero': instance.numero,
      'whatsapp': instance.whatsapp,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'principal': instance.principal,
      'deleted_at': instance.deletedAt,
    };
