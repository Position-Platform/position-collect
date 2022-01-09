/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:02:17 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:02:17 
 */
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  bool? success;
  Data? data;
  String? message;

  UserModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'UserModel(success: $success, data: $data, message: $message)';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return UserModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
