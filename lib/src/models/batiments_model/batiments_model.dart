/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-21 14:33:12 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-21 14:33:12 
 */
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'batiments_model.g.dart';

@JsonSerializable()
class BatimentsModel {
  bool? success;
  List<Datum>? data;
  String? message;

  BatimentsModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'BatimentsModel(success: $success, data: $data, message: $message)';
  }

  factory BatimentsModel.fromJson(Map<String, dynamic> json) {
    return _$BatimentsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BatimentsModelToJson(this);

  BatimentsModel copyWith({
    bool? success,
    List<Datum>? data,
    String? message,
  }) {
    return BatimentsModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
