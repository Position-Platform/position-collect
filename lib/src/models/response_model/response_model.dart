/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:02:00 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:02:00 
 */
import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  bool? success;
  String? data;
  String? message;

  ResponseModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'ResponseModel(success: $success, data: $data, message: $message)';
  }

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);

  ResponseModel copyWith({
    bool? success,
    String? data,
    String? message,
  }) {
    return ResponseModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
