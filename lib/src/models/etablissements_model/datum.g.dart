// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      idBatiment: json['idBatiment'] as String?,
      indicationAdresse: json['indicationAdresse'] as String?,
      codePostal: json['codePostal'] as String?,
      siteInternet: json['siteInternet'] as String?,
      idCommercial: json['idCommercial'] as String?,
      idManager: json['idManager'],
      etage: json['etage'] as String?,
      cover: json['cover'] as String?,
      vues: json['vues'] as String?,
      phone: json['phone'] as String?,
      whatsapp1: json['whatsapp1'] as String?,
      whatsapp2: json['whatsapp2'],
      description: json['description'] as String?,
      osmId: json['osmId'],
      updated: json['updated'] as bool?,
      revoir: json['revoir'] as String?,
      valide: json['valide'] as String?,
      services: json['services'] as String?,
      ameliorations: json['ameliorations'],
      avis: json['avis'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      idUser: json['idUser'] as int?,
      logo: json['logo'],
      batiment: json['batiment'] == null
          ? null
          : Batiment.fromJson(json['batiment'] as Map<String, dynamic>),
      sousCategories: (json['sous_categories'] as List<dynamic>?)
          ?.map((e) => SousCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      commodites: (json['commodites'] as List<dynamic>?)
          ?.map((e) => Commodite.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: json['images'] as List<dynamic>?,
      horaires: json['horaires'] as List<dynamic>?,
      commentaires: json['commentaires'] as List<dynamic>?,
      commercial: json['commercial'] == null
          ? null
          : Commercial.fromJson(json['commercial'] as Map<String, dynamic>),
      manager: json['manager'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
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
      'batiment': instance.batiment,
      'sous_categories': instance.sousCategories,
      'commodites': instance.commodites,
      'images': instance.images,
      'horaires': instance.horaires,
      'commentaires': instance.commentaires,
      'commercial': instance.commercial,
      'manager': instance.manager,
    };
