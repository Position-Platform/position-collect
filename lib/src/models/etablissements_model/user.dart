import 'package:json_annotation/json_annotation.dart';

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
  String? imageProfil;
  dynamic token;
  dynamic tokenSecret;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.fcmToken,
    this.imageProfil,
    this.token,
    this.tokenSecret,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, phone: $phone, fcmToken: $fcmToken, imageProfil: $imageProfil, token: $token, tokenSecret: $tokenSecret, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
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
    String? imageProfil,
    dynamic token,
    dynamic tokenSecret,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      phone: phone ?? this.phone,
      fcmToken: fcmToken ?? this.fcmToken,
      imageProfil: imageProfil ?? this.imageProfil,
      token: token ?? this.token,
      tokenSecret: tokenSecret ?? this.tokenSecret,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
