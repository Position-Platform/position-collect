// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etablissement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Etablissement _$EtablissementFromJson(Map<String, dynamic> json) =>
    Etablissement(
      id: json['id'] as int?,
      idBatiment: json['idBatiment'] as int?,
      nom: json['nom'] as String?,
      indicationAdresse: json['indicationAdresse'],
      codePostal: json['codePostal'],
      siteInternet: json['siteInternet'] as String?,
      idCommercial: json['idCommercial'] as int?,
      idManager: json['idManager'],
      etage: json['etage'] as int?,
      autres: json['autres'] as String?,
      cover: json['cover'] as String?,
      vues: json['vues'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      description: json['description'],
      revoir: json['revoir'] as int?,
      valide: json['valide'] as int?,
      deletedAt: json['deleted_at'],
      nomCommercial: json['nomCommercial'] as String?,
      sousCategories: (json['sous_categories'] as List<dynamic>?)
          ?.map((e) => SousCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      horaires: (json['horaires'] as List<dynamic>?)
          ?.map((e) => Horaire.fromJson(e as Map<String, dynamic>))
          .toList(),
      telephones: (json['telephones'] as List<dynamic>?)
          ?.map((e) => Telephone.fromJson(e as Map<String, dynamic>))
          .toList(),
      commercial: json['commercial'] == null
          ? null
          : Commercial.fromJson(json['commercial'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EtablissementToJson(Etablissement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idBatiment': instance.idBatiment,
      'nom': instance.nom,
      'indicationAdresse': instance.indicationAdresse,
      'codePostal': instance.codePostal,
      'siteInternet': instance.siteInternet,
      'idCommercial': instance.idCommercial,
      'idManager': instance.idManager,
      'etage': instance.etage,
      'autres': instance.autres,
      'cover': instance.cover,
      'vues': instance.vues,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'description': instance.description,
      'revoir': instance.revoir,
      'valide': instance.valide,
      'deleted_at': instance.deletedAt,
      'nomCommercial': instance.nomCommercial,
      'sous_categories': instance.sousCategories,
      'images': instance.images,
      'horaires': instance.horaires,
      'telephones': instance.telephones,
      'commercial': instance.commercial,
    };
