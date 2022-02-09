/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 13:47:35 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-02-09 13:47:35 
 */
import 'package:json_annotation/json_annotation.dart';

import 'etablissement.dart';

part 'etablissements.g.dart';

@JsonSerializable()
class Etablissements {
  bool? success;
  Etablissement? data;
  String? message;

  Etablissements({this.success, this.data, this.message});

  @override
  String toString() {
    return 'Etablissements(success: $success, data: $data, message: $message)';
  }

  factory Etablissements.fromJson(Map<String, dynamic> json) {
    return _$EtablissementsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EtablissementsToJson(this);

  Etablissements copyWith({
    bool? success,
    Etablissement? data,
    String? message,
  }) {
    return Etablissements(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
