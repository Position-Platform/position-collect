import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  bool? success;
  List<Datum>? data;
  String? message;

  SearchModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'SearchModel(success: $success, data: $data, message: $message)';
  }

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return _$SearchModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);

  SearchModel copyWith({
    bool? success,
    List<Datum>? data,
    String? message,
  }) {
    return SearchModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
