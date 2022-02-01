import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String? office;
  String? road;
  String? suburb;
  @JsonKey(name: 'city_district')
  String? cityDistrict;
  String? municipality;
  String? county;
  String? state;
  String? postcode;
  String? country;
  @JsonKey(name: 'country_code')
  String? countryCode;

  Address({
    this.office,
    this.road,
    this.suburb,
    this.cityDistrict,
    this.municipality,
    this.county,
    this.state,
    this.postcode,
    this.country,
    this.countryCode,
  });

  @override
  String toString() {
    return 'Address(office: $office, road: $road, suburb: $suburb, cityDistrict: $cityDistrict, municipality: $municipality, county: $county, state: $state, postcode: $postcode, country: $country, countryCode: $countryCode)';
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  Address copyWith({
    String? office,
    String? road,
    String? suburb,
    String? cityDistrict,
    String? municipality,
    String? county,
    String? state,
    String? postcode,
    String? country,
    String? countryCode,
  }) {
    return Address(
      office: office ?? this.office,
      road: road ?? this.road,
      suburb: suburb ?? this.suburb,
      cityDistrict: cityDistrict ?? this.cityDistrict,
      municipality: municipality ?? this.municipality,
      county: county ?? this.county,
      state: state ?? this.state,
      postcode: postcode ?? this.postcode,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
