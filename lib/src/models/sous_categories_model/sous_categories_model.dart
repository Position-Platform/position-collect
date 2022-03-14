import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'sous_categories_model.g.dart';

@JsonSerializable()
class SousCategoriesModel {
  bool? success;
  List<Datum>? data;
  String? message;

  SousCategoriesModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'SousCategoriesModel(success: $success, data: $data, message: $message)';
  }

  factory SousCategoriesModel.fromJson(Map<String, dynamic> json) {
    return _$SousCategoriesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SousCategoriesModelToJson(this);

  SousCategoriesModel copyWith({
    bool? success,
    List<Datum>? data,
    String? message,
  }) {
    return SousCategoriesModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
