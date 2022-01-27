// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batiments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatimentsModel _$BatimentsModelFromJson(Map<String, dynamic> json) =>
    BatimentsModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BatimentsModelToJson(BatimentsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
