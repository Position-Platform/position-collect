import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'nominatim_reverse_model.g.dart';

@JsonSerializable()
class NominatimReverseModel {
  @JsonKey(name: 'place_id')
  int? placeId;
  String? licence;
  @JsonKey(name: 'osm_type')
  String? osmType;
  @JsonKey(name: 'osm_id')
  int? osmId;
  String? lat;
  String? lon;
  @JsonKey(name: 'display_name')
  String? displayName;
  Address? address;
  List<String>? boundingbox;

  NominatimReverseModel({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.displayName,
    this.address,
    this.boundingbox,
  });

  @override
  String toString() {
    return 'NominatimReverseModel(placeId: $placeId, licence: $licence, osmType: $osmType, osmId: $osmId, lat: $lat, lon: $lon, displayName: $displayName, address: $address, boundingbox: $boundingbox)';
  }

  factory NominatimReverseModel.fromJson(Map<String, dynamic> json) {
    return _$NominatimReverseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NominatimReverseModelToJson(this);

  NominatimReverseModel copyWith({
    int? placeId,
    String? licence,
    String? osmType,
    int? osmId,
    String? lat,
    String? lon,
    String? displayName,
    Address? address,
    List<String>? boundingbox,
  }) {
    return NominatimReverseModel(
      placeId: placeId ?? this.placeId,
      licence: licence ?? this.licence,
      osmType: osmType ?? this.osmType,
      osmId: osmId ?? this.osmId,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      displayName: displayName ?? this.displayName,
      address: address ?? this.address,
      boundingbox: boundingbox ?? this.boundingbox,
    );
  }
}
