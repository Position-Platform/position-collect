// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Horaire _$HoraireFromJson(Map<String, dynamic> json) => Horaire(
      id: json['id'] as int?,
      idEtablissement: json['idEtablissement'] as int?,
      jour: json['jour'] as String?,
      ouvert: json['ouvert'] as int?,
      heureOuverture: json['heureOuverture'] as String?,
      heureFermeture: json['heureFermeture'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$HoraireToJson(Horaire instance) => <String, dynamic>{
      'id': instance.id,
      'idEtablissement': instance.idEtablissement,
      'jour': instance.jour,
      'ouvert': instance.ouvert,
      'heureOuverture': instance.heureOuverture,
      'heureFermeture': instance.heureFermeture,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
