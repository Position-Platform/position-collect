// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Batiment extends DataClass implements Insertable<Batiment> {
  final int id;
  final Datum? batiment;
  Batiment({required this.id, this.batiment});
  factory Batiment.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Batiment(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      batiment: $BatimentsTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}batiment'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || batiment != null) {
      final converter = $BatimentsTable.$converter0;
      map['batiment'] = Variable<String?>(converter.mapToSql(batiment));
    }
    return map;
  }

  BatimentsCompanion toCompanion(bool nullToAbsent) {
    return BatimentsCompanion(
      id: Value(id),
      batiment: batiment == null && nullToAbsent
          ? const Value.absent()
          : Value(batiment),
    );
  }

  factory Batiment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Batiment(
      id: serializer.fromJson<int>(json['id']),
      batiment: serializer.fromJson<Datum?>(json['batiment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'batiment': serializer.toJson<Datum?>(batiment),
    };
  }

  Batiment copyWith({int? id, Datum? batiment}) => Batiment(
        id: id ?? this.id,
        batiment: batiment ?? this.batiment,
      );
  @override
  String toString() {
    return (StringBuffer('Batiment(')
          ..write('id: $id, ')
          ..write('batiment: $batiment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, batiment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Batiment &&
          other.id == this.id &&
          other.batiment == this.batiment);
}

class BatimentsCompanion extends UpdateCompanion<Batiment> {
  final Value<int> id;
  final Value<Datum?> batiment;
  const BatimentsCompanion({
    this.id = const Value.absent(),
    this.batiment = const Value.absent(),
  });
  BatimentsCompanion.insert({
    this.id = const Value.absent(),
    this.batiment = const Value.absent(),
  });
  static Insertable<Batiment> custom({
    Expression<int>? id,
    Expression<Datum?>? batiment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batiment != null) 'batiment': batiment,
    });
  }

  BatimentsCompanion copyWith({Value<int>? id, Value<Datum?>? batiment}) {
    return BatimentsCompanion(
      id: id ?? this.id,
      batiment: batiment ?? this.batiment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (batiment.present) {
      final converter = $BatimentsTable.$converter0;
      map['batiment'] = Variable<String?>(converter.mapToSql(batiment.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BatimentsCompanion(')
          ..write('id: $id, ')
          ..write('batiment: $batiment')
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
  final VerificationMeta _batimentMeta = const VerificationMeta('batiment');
  @override
  late final GeneratedColumnWithTypeConverter<Datum, String?> batiment =
      GeneratedColumn<String?>('batiment', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<Datum>($BatimentsTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [id, batiment];
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
    context.handle(_batimentMeta, const VerificationResult.success());
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

  static TypeConverter<Datum, String> $converter0 = const BatimentConverter();
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
