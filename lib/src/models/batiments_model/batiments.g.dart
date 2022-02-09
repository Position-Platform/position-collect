// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batiments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Batiments _$BatimentsFromJson(Map<String, dynamic> json) => Batiments(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Datum.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BatimentsToJson(Batiments instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
