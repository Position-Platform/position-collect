// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etablissement_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EtablissementUpdateModel _$EtablissementUpdateModelFromJson(
        Map<String, dynamic> json) =>
    EtablissementUpdateModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EtablissementUpdateModelToJson(
        EtablissementUpdateModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
