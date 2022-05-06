// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etablissement_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EtablissementPost _$EtablissementPostFromJson(Map<String, dynamic> json) =>
    EtablissementPost(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EtablissementPostToJson(EtablissementPost instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
