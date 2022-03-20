// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etablissements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EtablissementsModel _$EtablissementsModelFromJson(Map<String, dynamic> json) =>
    EtablissementsModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EtablissementsModelToJson(
        EtablissementsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
