/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:02:14 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:02:14 
 */
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  @override
  String toString() => 'Data(user: $user,token: $token)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    User? user,
    String? token,
  }) {
    return Data(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}
