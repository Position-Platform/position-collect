// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      phone: json['phone'] as String?,
      fcmToken: json['fcmToken'],
      imageProfil: json['imageProfil'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      commercial: json['commercial'] == null
          ? null
          : Commercial.fromJson(json['commercial'] as Map<String, dynamic>),
      manager: json['manager'],
      admin: json['admin'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'phone': instance.phone,
      'fcmToken': instance.fcmToken,
      'imageProfil': instance.imageProfil,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'roles': instance.roles,
      'commercial': instance.commercial,
      'manager': instance.manager,
      'admin': instance.admin,
    };
