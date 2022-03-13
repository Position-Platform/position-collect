import 'package:json_annotation/json_annotation.dart';

import 'role.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  String? phone;
  dynamic fcmToken;
  dynamic imageProfil;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  List<Role>? roles;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.fcmToken,
    this.imageProfil,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, phone: $phone, fcmToken: $fcmToken, imageProfil: $imageProfil, createdAt: $createdAt, updatedAt: $updatedAt, roles: $roles)';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? phone,
    dynamic fcmToken,
    dynamic imageProfil,
    String? createdAt,
    String? updatedAt,
    List<Role>? roles,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      phone: phone ?? this.phone,
      fcmToken: fcmToken ?? this.fcmToken,
      imageProfil: imageProfil ?? this.imageProfil,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      roles: roles ?? this.roles,
    );
  }
}
