// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      idBatiment: json['idBatiment'] as String?,
      indicationAdresse: json['indicationAdresse'] as String?,
      codePostal: json['codePostal'] as String?,
      siteInternet: json['siteInternet'] as String?,
      idCommercial: json['idCommercial'] as String?,
      idManager: json['idManager'] as String?,
      etage: json['etage'] as String?,
      cover: json['cover'] as String?,
      vues: json['vues'] as String?,
      phone: json['phone'] as String?,
      whatsapp1: json['whatsapp1'] as String?,
      whatsapp2: json['whatsapp2'] as String?,
      description: json['description'] as String?,
      osmId: json['osmId'] as String?,
      updated: json['updated'] as bool?,
      revoir: json['revoir'] as String?,
      valide: json['valide'] as String?,
      services: json['services'] as String?,
      ameliorations: json['ameliorations'] as String?,
      avis: json['avis'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      idUser: json['idUser'] as String?,
      logo: json['logo'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'idBatiment': instance.idBatiment,
      'indicationAdresse': instance.indicationAdresse,
      'codePostal': instance.codePostal,
      'siteInternet': instance.siteInternet,
      'idCommercial': instance.idCommercial,
      'idManager': instance.idManager,
      'etage': instance.etage,
      'cover': instance.cover,
      'vues': instance.vues,
      'phone': instance.phone,
      'whatsapp1': instance.whatsapp1,
      'whatsapp2': instance.whatsapp2,
      'description': instance.description,
      'osmId': instance.osmId,
      'updated': instance.updated,
      'revoir': instance.revoir,
      'valide': instance.valide,
      'services': instance.services,
      'ameliorations': instance.ameliorations,
      'avis': instance.avis,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'idUser': instance.idUser,
      'logo': instance.logo,
    };
