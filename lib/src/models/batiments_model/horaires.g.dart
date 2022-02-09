// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horaires.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Horaires _$HorairesFromJson(Map<String, dynamic> json) => Horaires(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Horaire.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$HorairesToJson(Horaires instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
