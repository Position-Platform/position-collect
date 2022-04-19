// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horaire_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HoraireModel _$HoraireModelFromJson(Map<String, dynamic> json) => HoraireModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$HoraireModelToJson(HoraireModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
