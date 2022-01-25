import 'package:json_annotation/json_annotation.dart';

import 'feature.dart';

part 'batiments_model.g.dart';

@JsonSerializable()
class BatimentsModel {
  String? type;
  List<Feature>? features;

  BatimentsModel({this.type, this.features});

  @override
  String toString() => 'BatimentsModel(type: $type, features: $features)';

  factory BatimentsModel.fromJson(Map<String, dynamic> json) {
    return _$BatimentsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BatimentsModelToJson(this);

  BatimentsModel copyWith({
    String? type,
    List<Feature>? features,
  }) {
    return BatimentsModel(
      type: type ?? this.type,
      features: features ?? this.features,
    );
  }
}
