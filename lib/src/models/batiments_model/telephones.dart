/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 13:47:20 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-02-09 13:47:20 
 */
import 'package:json_annotation/json_annotation.dart';

import 'telephone.dart';

part 'telephones.g.dart';

@JsonSerializable()
class Telephones {
  bool? success;
  Telephone? data;
  String? message;

  Telephones({this.success, this.data, this.message});

  @override
  String toString() {
    return 'Telephones(success: $success, data: $data, message: $message)';
  }

  factory Telephones.fromJson(Map<String, dynamic> json) {
    return _$TelephonesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TelephonesToJson(this);

  Telephones copyWith({
    bool? success,
    Telephone? data,
    String? message,
  }) {
    return Telephones(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
