import 'package:json_annotation/json_annotation.dart';

part 'batiment.g.dart';

@JsonSerializable()
class Batiment {
  int? id;
  String? nom;
  int? nombreNiveaux;
  String? codeBatiment;
  double? longitude;
  double? latitude;
  String? image;
  dynamic indication;
  String? rue;
  String? ville;
  String? commune;
  String? quartier;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  Batiment({
    this.id,
    this.nom,
    this.nombreNiveaux,
    this.codeBatiment,
    this.longitude,
    this.latitude,
    this.image,
    this.indication,
    this.rue,
    this.ville,
    this.commune,
    this.quartier,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  String toString() {
    return 'Batiment(id: $id, nom: $nom, nombreNiveaux: $nombreNiveaux, codeBatiment: $codeBatiment, longitude: $longitude, latitude: $latitude, image: $image, indication: $indication, rue: $rue, ville: $ville, commune: $commune, quartier: $quartier, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  factory Batiment.fromJson(Map<String, dynamic> json) {
    return _$BatimentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BatimentToJson(this);

  Batiment copyWith({
    int? id,
    String? nom,
    int? nombreNiveaux,
    String? codeBatiment,
    double? longitude,
    double? latitude,
    String? image,
    dynamic indication,
    String? rue,
    String? ville,
    String? commune,
    String? quartier,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) {
    return Batiment(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      nombreNiveaux: nombreNiveaux ?? this.nombreNiveaux,
      codeBatiment: codeBatiment ?? this.codeBatiment,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      image: image ?? this.image,
      indication: indication ?? this.indication,
      rue: rue ?? this.rue,
      ville: ville ?? this.ville,
      commune: commune ?? this.commune,
      quartier: quartier ?? this.quartier,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
