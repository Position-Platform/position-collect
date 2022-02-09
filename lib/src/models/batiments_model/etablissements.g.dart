// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etablissements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Etablissements _$EtablissementsFromJson(Map<String, dynamic> json) =>
    Etablissements(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Etablissement.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EtablissementsToJson(Etablissements instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
