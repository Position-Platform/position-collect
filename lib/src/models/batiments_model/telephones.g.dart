// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telephones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Telephones _$TelephonesFromJson(Map<String, dynamic> json) => Telephones(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Telephone.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TelephonesToJson(Telephones instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
