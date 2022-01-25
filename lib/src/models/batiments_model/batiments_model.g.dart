// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batiments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatimentsModel _$BatimentsModelFromJson(Map<String, dynamic> json) =>
    BatimentsModel(
      type: json['type'] as String?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatimentsModelToJson(BatimentsModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'features': instance.features,
    };
