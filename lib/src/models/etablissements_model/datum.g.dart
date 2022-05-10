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
      idUser: json['idUser'] as String?,
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
      logo: json['logo'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
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
      manager: json['manager'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      commercial: json['commercial'] == null
          ? null
          : Commercial.fromJson(json['commercial'] as Map<String, dynamic>),
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
      'idUser': instance.idUser,
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
      'logo': instance.logo,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'batiment': instance.batiment,
      'sous_categories': instance.sousCategories,
      'commodites': instance.commodites,
      'images': instance.images,
      'horaires': instance.horaires,
      'commentaires': instance.commentaires,
      'manager': instance.manager,
      'user': instance.user,
      'commercial': instance.commercial,
    };
