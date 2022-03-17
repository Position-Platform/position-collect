import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'batiment_model.g.dart';

@JsonSerializable()
class BatimentModel {
  bool? success;
  Data? data;
  String? message;

  BatimentModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'BatimentModel(success: $success, data: $data, message: $message)';
  }

  factory BatimentModel.fromJson(Map<String, dynamic> json) {
    return _$BatimentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BatimentModelToJson(this);

  BatimentModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return BatimentModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
