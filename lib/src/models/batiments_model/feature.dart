import 'package:json_annotation/json_annotation.dart';

import 'geometry.dart';
import 'properties.dart';

part 'feature.g.dart';

@JsonSerializable()
class Feature {
  String? type;
  Geometry? geometry;
  Properties? properties;

  Feature({this.type, this.geometry, this.properties});

  @override
  String toString() {
    return 'Feature(type: $type, geometry: $geometry, properties: $properties)';
  }

  factory Feature.fromJson(Map<String, dynamic> json) {
    return _$FeatureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FeatureToJson(this);

  Feature copyWith({
    String? type,
    Geometry? geometry,
    Properties? properties,
  }) {
    return Feature(
      type: type ?? this.type,
      geometry: geometry ?? this.geometry,
      properties: properties ?? this.properties,
    );
  }
}
