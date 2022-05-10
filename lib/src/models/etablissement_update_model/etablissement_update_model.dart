import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'etablissement_update_model.g.dart';

@JsonSerializable()
class EtablissementUpdateModel {
  bool? success;
  Data? data;
  String? message;

  EtablissementUpdateModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'EtablissementUpdateModel(success: $success, data: $data, message: $message)';
  }

  factory EtablissementUpdateModel.fromJson(Map<String, dynamic> json) {
    return _$EtablissementUpdateModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EtablissementUpdateModelToJson(this);

  EtablissementUpdateModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return EtablissementUpdateModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
