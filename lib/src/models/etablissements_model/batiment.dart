import 'package:json_annotation/json_annotation.dart';

part 'batiment.g.dart';

@JsonSerializable()
class Batiment {
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
  int? idUser;

  Batiment({
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
    this.idUser,
  });

  @override
  String toString() {
    return 'Batiment(id: $id, nom: $nom, nombreNiveau: $nombreNiveau, codeBatiment: $codeBatiment, longitude: $longitude, latitude: $latitude, image: $image, indication: $indication, rue: $rue, ville: $ville, commune: $commune, quartier: $quartier, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, idCommercial: $idCommercial, idUser: $idUser)';
  }

  factory Batiment.fromJson(Map<String, dynamic> json) {
    return _$BatimentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BatimentToJson(this);

  Batiment copyWith({
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
    int? idUser,
  }) {
    return Batiment(
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
      idUser: idUser ?? this.idUser,
    );
  }
}