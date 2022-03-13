import 'package:json_annotation/json_annotation.dart';

import 'etablissement.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? nom;
  String? nombreNiveau;
  String? codeBatiment;
  String? longitude;
  String? latitude;
  String? image;
  String? indication;
  String? rue;
  String? ville;
  String? commune;
  String? quartier;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  int? idCommercial;
  List<Etablissement>? etablissements;

  Datum({
    this.id,
    this.nom,
    this.nombreNiveau,
    this.codeBatiment,
    this.longitude,
    this.latitude,
    this.image,
    this.indication,
    this.rue,
    this.ville,
    this.commune,
    this.quartier,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.idCommercial,
    this.etablissements,
  });

  @override
  String toString() {
    return 'Datum(id: $id, nom: $nom, nombreNiveau: $nombreNiveau, codeBatiment: $codeBatiment, longitude: $longitude, latitude: $latitude, image: $image, indication: $indication, rue: $rue, ville: $ville, commune: $commune, quartier: $quartier, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, idCommercial: $idCommercial, etablissements: $etablissements)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    String? nom,
    String? nombreNiveau,
    String? codeBatiment,
    String? longitude,
    String? latitude,
    String? image,
    String? indication,
    String? rue,
    String? ville,
    String? commune,
    String? quartier,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
    int? idCommercial,
    List<Etablissement>? etablissements,
  }) {
    return Datum(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      nombreNiveau: nombreNiveau ?? this.nombreNiveau,
      codeBatiment: codeBatiment ?? this.codeBatiment,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      image: image ?? this.image,
      indication: indication ?? this.indication,
      rue: rue ?? this.rue,
      ville: ville ?? this.ville,
      commune: commune ?? this.commune,
      quartier: quartier ?? this.quartier,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      idCommercial: idCommercial ?? this.idCommercial,
      etablissements: etablissements ?? this.etablissements,
    );
  }
}
