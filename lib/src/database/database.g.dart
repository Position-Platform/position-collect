// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Batiment extends DataClass implements Insertable<Batiment> {
  final int id;
  final String geojson;
  final int nombreBatiment;
  Batiment(
      {required this.id, required this.geojson, required this.nombreBatiment});
  factory Batiment.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Batiment(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      geojson: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}geojson'])!,
      nombreBatiment: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_batiment'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['geojson'] = Variable<String>(geojson);
    map['nombre_batiment'] = Variable<int>(nombreBatiment);
    return map;
  }

  BatimentsCompanion toCompanion(bool nullToAbsent) {
    return BatimentsCompanion(
      id: Value(id),
      geojson: Value(geojson),
      nombreBatiment: Value(nombreBatiment),
    );
  }

  factory Batiment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Batiment(
      id: serializer.fromJson<int>(json['id']),
      geojson: serializer.fromJson<String>(json['geojson']),
      nombreBatiment: serializer.fromJson<int>(json['nombreBatiment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'geojson': serializer.toJson<String>(geojson),
      'nombreBatiment': serializer.toJson<int>(nombreBatiment),
    };
  }

  Batiment copyWith({int? id, String? geojson, int? nombreBatiment}) =>
      Batiment(
        id: id ?? this.id,
        geojson: geojson ?? this.geojson,
        nombreBatiment: nombreBatiment ?? this.nombreBatiment,
      );
  @override
  String toString() {
    return (StringBuffer('Batiment(')
          ..write('id: $id, ')
          ..write('geojson: $geojson, ')
          ..write('nombreBatiment: $nombreBatiment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, geojson, nombreBatiment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Batiment &&
          other.id == this.id &&
          other.geojson == this.geojson &&
          other.nombreBatiment == this.nombreBatiment);
}

class BatimentsCompanion extends UpdateCompanion<Batiment> {
  final Value<int> id;
  final Value<String> geojson;
  final Value<int> nombreBatiment;
  const BatimentsCompanion({
    this.id = const Value.absent(),
    this.geojson = const Value.absent(),
    this.nombreBatiment = const Value.absent(),
  });
  BatimentsCompanion.insert({
    this.id = const Value.absent(),
    required String geojson,
    this.nombreBatiment = const Value.absent(),
  }) : geojson = Value(geojson);
  static Insertable<Batiment> custom({
    Expression<int>? id,
    Expression<String>? geojson,
    Expression<int>? nombreBatiment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (geojson != null) 'geojson': geojson,
      if (nombreBatiment != null) 'nombre_batiment': nombreBatiment,
    });
  }

  BatimentsCompanion copyWith(
      {Value<int>? id, Value<String>? geojson, Value<int>? nombreBatiment}) {
    return BatimentsCompanion(
      id: id ?? this.id,
      geojson: geojson ?? this.geojson,
      nombreBatiment: nombreBatiment ?? this.nombreBatiment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (geojson.present) {
      map['geojson'] = Variable<String>(geojson.value);
    }
    if (nombreBatiment.present) {
      map['nombre_batiment'] = Variable<int>(nombreBatiment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BatimentsCompanion(')
          ..write('id: $id, ')
          ..write('geojson: $geojson, ')
          ..write('nombreBatiment: $nombreBatiment')
          ..write(')'))
        .toString();
  }
}

class $BatimentsTable extends Batiments
    with TableInfo<$BatimentsTable, Batiment> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BatimentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _geojsonMeta = const VerificationMeta('geojson');
  @override
  late final GeneratedColumn<String?> geojson = GeneratedColumn<String?>(
      'geojson', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nombreBatimentMeta =
      const VerificationMeta('nombreBatiment');
  @override
  late final GeneratedColumn<int?> nombreBatiment = GeneratedColumn<int?>(
      'nombre_batiment', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, geojson, nombreBatiment];
  @override
  String get aliasedName => _alias ?? 'batiments';
  @override
  String get actualTableName => 'batiments';
  @override
  VerificationContext validateIntegrity(Insertable<Batiment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('geojson')) {
      context.handle(_geojsonMeta,
          geojson.isAcceptableOrUnknown(data['geojson']!, _geojsonMeta));
    } else if (isInserting) {
      context.missing(_geojsonMeta);
    }
    if (data.containsKey('nombre_batiment')) {
      context.handle(
          _nombreBatimentMeta,
          nombreBatiment.isAcceptableOrUnknown(
              data['nombre_batiment']!, _nombreBatimentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Batiment map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Batiment.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BatimentsTable createAlias(String alias) {
    return $BatimentsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $BatimentsTable batiments = $BatimentsTable(this);
  late final BatimentsDao batimentsDao = BatimentsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [batiments];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$BatimentsDaoMixin on DatabaseAccessor<AppDatabase> {
  $BatimentsTable get batiments => attachedDatabase.batiments;
}
