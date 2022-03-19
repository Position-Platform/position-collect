// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Batiment _$BatimentFromJson(Map<String, dynamic> json) => Batiment(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      nombreNiveaux: json['nombreNiveaux'] as int?,
      codeBatiment: json['codeBatiment'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      image: json['image'] as String?,
      indication: json['indication'],
      rue: json['rue'] as String?,
      ville: json['ville'] as String?,
      commune: json['commune'] as String?,
      quartier: json['quartier'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$BatimentToJson(Batiment instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'nombreNiveaux': instance.nombreNiveaux,
      'codeBatiment': instance.codeBatiment,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'image': instance.image,
      'indication': instance.indication,
      'rue': instance.rue,
      'ville': instance.ville,
      'commune': instance.commune,
      'quartier': instance.quartier,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
