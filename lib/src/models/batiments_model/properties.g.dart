// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      nombreNiveaux: json['nombreNiveaux'] as int?,
      codeBatiment: json['codeBatiment'] as String?,
      longitude: json['longitude'] as int?,
      latitude: json['latitude'] as int?,
      image: json['image'],
      indication: json['indication'] as String?,
      rue: json['rue'] as String?,
      ville: json['ville'] as String?,
      commune: json['commune'] as String?,
      quartier: json['quartier'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
      etablissements: json['etablissements'] as List<dynamic>?,
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
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
      'etablissements': instance.etablissements,
    };
