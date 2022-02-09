/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 13:47:31 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-02-09 13:47:31 
 */
import 'package:json_annotation/json_annotation.dart';

import 'horaire.dart';

part 'horaires.g.dart';

@JsonSerializable()
class Horaires {
  bool? success;
  Horaire? data;
  String? message;

  Horaires({this.success, this.data, this.message});

  @override
  String toString() {
    return 'Horaires(success: $success, data: $data, message: $message)';
  }

  factory Horaires.fromJson(Map<String, dynamic> json) {
    return _$HorairesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HorairesToJson(this);

  Horaires copyWith({
    bool? success,
    Horaire? data,
    String? message,
  }) {
    return Horaires(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
