import 'package:json_annotation/json_annotation.dart';

part 'geometry.g.dart';

@JsonSerializable()
class Geometry {
  String? type;
  List<int>? coordinates;

  Geometry({this.type, this.coordinates});

  @override
  String toString() => 'Geometry(type: $type, coordinates: $coordinates)';

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return _$GeometryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeometryToJson(this);

  Geometry copyWith({
    String? type,
    List<int>? coordinates,
  }) {
    return Geometry(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
    );
  }
}
