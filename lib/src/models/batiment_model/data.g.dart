// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      nombreNiveau: json['nombreNiveau'] as String?,
      codeBatiment: json['codeBatiment'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      image: json['image'],
      indication: json['indication'] as String?,
      rue: json['rue'] as String?,
      ville: json['ville'] as String?,
      commune: json['commune'] as String?,
      quartier: json['quartier'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      idCommercial: json['idCommercial'] as int?,
      idUser: json['idUser'],
      etablissements: (json['etablissements'] as List<dynamic>?)
          ?.map((e) => Etablissement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'nombreNiveau': instance.nombreNiveau,
      'codeBatiment': instance.codeBatiment,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'image': instance.image,
      'indication': instance.indication,
      'rue': instance.rue,
      'ville': instance.ville,
      'commune': instance.commune,
      'quartier': instance.quartier,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'idCommercial': instance.idCommercial,
      'idUser': instance.idUser,
      'etablissements': instance.etablissements,
    };
