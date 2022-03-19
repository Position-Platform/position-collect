// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batiment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatimentModel _$BatimentModelFromJson(Map<String, dynamic> json) =>
    BatimentModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BatimentModelToJson(BatimentModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
