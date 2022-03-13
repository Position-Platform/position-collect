// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Horaire _$HoraireFromJson(Map<String, dynamic> json) => Horaire(
      id: json['id'] as int?,
      idEtablissement: json['idEtablissement'] as int?,
      jour: json['jour'] as String?,
      plageHoraire: json['plageHoraire'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$HoraireToJson(Horaire instance) => <String, dynamic>{
      'id': instance.id,
      'idEtablissement': instance.idEtablissement,
      'jour': instance.jour,
      'plageHoraire': instance.plageHoraire,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
