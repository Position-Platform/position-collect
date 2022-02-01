// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nominatim_reverse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NominatimReverseModel _$NominatimReverseModelFromJson(
        Map<String, dynamic> json) =>
    NominatimReverseModel(
      placeId: json['place_id'] as int?,
      licence: json['licence'] as String?,
      osmType: json['osm_type'] as String?,
      osmId: json['osm_id'] as int?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      displayName: json['display_name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      boundingbox: (json['boundingbox'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NominatimReverseModelToJson(
        NominatimReverseModel instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'licence': instance.licence,
      'osm_type': instance.osmType,
      'osm_id': instance.osmId,
      'lat': instance.lat,
      'lon': instance.lon,
      'display_name': instance.displayName,
      'address': instance.address,
      'boundingbox': instance.boundingbox,
    };
