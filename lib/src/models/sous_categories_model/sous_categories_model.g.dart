// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sous_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SousCategoriesModel _$SousCategoriesModelFromJson(Map<String, dynamic> json) =>
    SousCategoriesModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SousCategoriesModelToJson(
        SousCategoriesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
