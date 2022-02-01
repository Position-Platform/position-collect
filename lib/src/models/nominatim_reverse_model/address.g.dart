// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      office: json['office'] as String?,
      road: json['road'] as String?,
      suburb: json['suburb'] as String?,
      cityDistrict: json['city_district'] as String?,
      municipality: json['municipality'] as String?,
      county: json['county'] as String?,
      state: json['state'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'office': instance.office,
      'road': instance.road,
      'suburb': instance.suburb,
      'city_district': instance.cityDistrict,
      'municipality': instance.municipality,
      'county': instance.county,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.countryCode,
    };
