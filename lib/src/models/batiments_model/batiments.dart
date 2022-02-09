/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 13:47:40 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-02-09 13:47:40 
 */
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'batiments.g.dart';

@JsonSerializable()
class Batiments {
  bool? success;
  Datum? data;
  String? message;

  Batiments({this.success, this.data, this.message});

  @override
  String toString() {
    return 'Batiments(success: $success, data: $data, message: $message)';
  }

  factory Batiments.fromJson(Map<String, dynamic> json) {
    return _$BatimentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BatimentsToJson(this);

  Batiments copyWith({
    bool? success,
    Datum? data,
    String? message,
  }) {
    return Batiments(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
