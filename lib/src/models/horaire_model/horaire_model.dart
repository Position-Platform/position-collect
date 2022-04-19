import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'horaire_model.g.dart';

@JsonSerializable()
class HoraireModel {
  bool? success;
  Data? data;
  String? message;

  HoraireModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'HoraireModel(success: $success, data: $data, message: $message)';
  }

  factory HoraireModel.fromJson(Map<String, dynamic> json) {
    return _$HoraireModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HoraireModelToJson(this);

  HoraireModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return HoraireModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
