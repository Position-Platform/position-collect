// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      nom: json['nom'] as String?,
      indicationAdresse: json['indicationAdresse'],
      codePostal: json['codePostal'],
      siteInternet: json['siteInternet'],
      etage: json['etage'] as String?,
      phone: json['phone'] as String?,
      whatsapp1: json['whatsapp1'] as String?,
      whatsapp2: json['whatsapp2'],
      description: json['description'],
      osmId: json['osmId'],
      services: json['services'] as String?,
      ameliorations: json['ameliorations'],
      cover: json['cover'] as String?,
      idCommercial: json['idCommercial'] as int?,
      idBatiment: json['idBatiment'] as int?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'nom': instance.nom,
      'indicationAdresse': instance.indicationAdresse,
      'codePostal': instance.codePostal,
      'siteInternet': instance.siteInternet,
      'etage': instance.etage,
      'phone': instance.phone,
      'whatsapp1': instance.whatsapp1,
      'whatsapp2': instance.whatsapp2,
      'description': instance.description,
      'osmId': instance.osmId,
      'services': instance.services,
      'ameliorations': instance.ameliorations,
      'cover': instance.cover,
      'idCommercial': instance.idCommercial,
      'idBatiment': instance.idBatiment,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
